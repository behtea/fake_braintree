module MerchantAccountHelpers

  def hash_individual_merchant_account_data
    {
      :first_name => "", :last_name => "", :email => "", :phone => "", :date_of_birth => "", :ssn => "",
      :address => {:street_address => "", :locality => "", :region => "", :postal_code => "" }
    }
  end

  def hash_business_merchant_account_data
    {
      :legal_name => "", :dba_name => "", :tax_id => "",
      :address => {:street_address => "", :locality => "", :region => "", :postal_code => ""}    
    }
  end

  def hash_funding_merchant_account_data
    {
      :destination => "", :email => "", :mobile_phone => "", :account_number => "", :routing_number => ""
    }    
  end

  def valid_individual_merchant_account_data
    data = hash_individual_merchant_account_data
    data[:first_name] = "Jane"
    data[:last_name] = "Doe"
    data[:email] = "jane@14ladders.com"
    data[:phone] = "5553334444"
    data[:date_of_birth] = "1981-11-19"
    data[:ssn] = "456-45-4567"
    data[:address] = {
      :street_address => "111 Main St",
      :locality => "Chicago",
      :region => "IL",
      :postal_code => "60622"
    }
    data
  end

  def valid_business_merchant_account_data
    data = hash_business_merchant_account_data
    data[:legal_name] = "Jane's Ladders"
    data[:dba_name] = "Jane's Ladders"
    data[:tax_id] = "98-7654321"
    data[:address] = {
      :street_address => "111 Main St",
      :locality => "Chicago",
      :region => "IL",
      :postal_code => "60622"
    }    
    data
  end

  def valid_funding_merchant_account_data
    data = hash_funding_merchant_account_data
    data[:destination] = Braintree::MerchantAccount::FundingDestination::Bank
    data[:email] = "funding@blueladders.com"
    data[:mobile_phone] = "5555555555"
    data[:account_number] = "1123581321"
    data[:routing_number] = "071101307"
    data
  end  

  def data_master_merchant_account_id
    Digest::MD5.hexdigest(Time.now.to_s) 
  end
end