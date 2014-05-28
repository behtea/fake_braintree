module FakeBraintree
  class MerchantAccount
    include Helpers

    def initialize(merchant_account_hash_from_params, options)
      @merchant_account_hash = {
        'id' => options[:id],
        'merchant_id' => options[:merchant_id],
        "status" => "pending",
        "master_merchant_account" => nil
      }
      @merchant_account_hash.merge!(merchant_account_hash_from_params)
      set_merchant_account_id
    end

    def create      
      if invalid?
        response_for_invalid_params
      else
        create_merchant_account_with(merchant_account_hash)
        response_for_created_merchant_account(merchant_account_hash)
      end      
    end

    def merchant_account_hash
      @merchant_account_hash
    end   

    def create_merchant_account_with(hash)
      FakeBraintree.registry.merchant_accounts[hash['id']] = hash
    end    

    def invalid?
      !individual_hash.present? #&& !business_hash.present?
    end     

    def individual_hash
      @merchant_account_hash['individual'] || {}
    end    

    def business_hash
      @merchant_account_hash['business'] || {}
    end    

    def set_merchant_account_id
      @merchant_account_hash['id'] ||= create_id(@merchant_account_hash['merchant_id'])
    end    

    def response_for_created_merchant_account(hash)
      gzipped_response(201, hash.to_xml(root: 'merchant_account'))
    end

    def response_for_invalid_params
      failure_response(422)
    end

    def response_for_customer_not_found
      failure_response(404)
    end

    def failure_response(code)
      gzipped_response(code, FakeBraintree.create_merchant_account_failure.to_xml(root: 'api_error_response'))
    end    
  end
end