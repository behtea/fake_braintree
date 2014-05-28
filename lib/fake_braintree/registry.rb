class FakeBraintree::Registry
  def initialize
    clear!
  end

  attr_accessor :customers,:subscriptions, :failures, :transactions, :redirects,
    :credit_cards, :addresses, :merchant_accounts

  def clear!
    @addresses     = {}
    @customers     = {}
    @subscriptions = {}
    @failures      = {}
    @transactions  = {}
    @redirects     = {}
    @credit_cards  = {}
    @merchant_accounts = {}
  end

  def failure?(card_number)
    @failures.keys.include?(card_number)
  end
end
