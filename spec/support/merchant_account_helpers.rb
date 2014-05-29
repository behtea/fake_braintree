module MerchantAccountHelpers

  def hash_individual_merchant_account_data(options = {})
    {
      :first_name => options[:first_name] || "Jane", 
      :last_name => options[:last_name] || "Doe", 
      :email => options[:email] || "jane@14ladders.com", 
      :phone => options[:phone] || "5553334444", 
      :date_of_birth => options[:date_of_birth] || "1981-11-19", 
      :ssn => options[:ssn] || "456-45-4567",
      :address => {
        :street_address => options[:street_address] || "111 Main St", 
        :locality => options[:locality] || "Chicago", 
        :region => options[:region] || "IL", 
        :postal_code => options[:postal_code] || "60622"
      }
    }
  end

  def hash_business_merchant_account_data(options = {})
    {
      :legal_name => options[:legal_name] || "Jane's Ladders",  
      :tax_id => options[:tax_id] || "98-7654321", 
      :dba_name => "",
      :address => {
        :street_address => "", 
        :locality => "", 
        :region => "", 
        :postal_code => ""
      }    
    }
  end

  def hash_funding_merchant_account_data(options = {})
    {
      :destination => Braintree::MerchantAccount::FundingDestination::Bank, 
      :email => "", :mobile_phone => "",
      :account_number => options[:account_number] || "1123581321",
      :routing_number => options[:routing_number] || "071101307"        
    }    
  end

  def data_master_merchant_account_id
    Digest::MD5.hexdigest(Time.now.to_s) 
  end
end