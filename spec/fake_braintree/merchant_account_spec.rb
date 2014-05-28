require 'spec_helper'

describe 'Braintree::MerchantAccount.create' do  

  it 'successfully creates a merchant account individual' do
    result = Braintree::MerchantAccount.create(
      :individual => valid_individual_merchant_account_data,
      :funding => valid_funding_merchant_account_data,
      :tos_accepted => true,
      :master_merchant_account_id => data_master_merchant_account_id,
    )
    expect(result).to be_success
  end

  it 'successfully creates a merchant account business' do
    result = Braintree::MerchantAccount.create(
      :individual => valid_individual_merchant_account_data,
      :business => valid_business_merchant_account_data,
      :funding => valid_funding_merchant_account_data,
      :tos_accepted => true,
      :master_merchant_account_id => data_master_merchant_account_id,
    )
    expect(result).to be_success
  end  

  it 'failes creates a merchant account individual' do
    result = Braintree::MerchantAccount.create(
      :funding => valid_funding_merchant_account_data,
      :tos_accepted => true,
      :master_merchant_account_id => data_master_merchant_account_id,
    )
    expect(result).not_to be_success
  end

  it 'failes creates a merchant account business' do
    result = Braintree::MerchantAccount.create(
      :business => valid_business_merchant_account_data,
      :funding => valid_funding_merchant_account_data,
      :tos_accepted => true,
      :master_merchant_account_id => data_master_merchant_account_id,
    )
    expect(result).not_to be_success
  end  
end

describe 'Braintree::MerchantAccount.find' do  

  it 'successfully finds a merchant account' do
    result = Braintree::MerchantAccount.create(
      :individual => valid_individual_merchant_account_data,
      :business => valid_business_merchant_account_data,
      :funding => valid_funding_merchant_account_data,
      :tos_accepted => true,
      :master_merchant_account_id => data_master_merchant_account_id,
    )
    expect(Braintree::MerchantAccount.find(result.merchant_account.id).id).to eq result.merchant_account.id
  end

  it 'raises an error for a nonexistent merchant account' do
    expect(lambda { Braintree::MerchantAccount.find('foo') }).to raise_error(Braintree::NotFoundError)
  end
end