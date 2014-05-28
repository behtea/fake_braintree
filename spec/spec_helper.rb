require 'bundler'

Bundler.require

require 'rspec'
require 'fake_braintree'
require 'timecop'

def clear_braintree_log
  Dir.mkdir('tmp') unless File.directory?('tmp')
  File.new('tmp/braintree_log', 'w').close
end

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each {|f| require f}

clear_braintree_log

TEST_CC_NUMBER = %w(4111 1111 1111 1111).join

RSpec.configure do |config|
  config.mock_with :rspec

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :random

  config.include BraintreeHelpers
  config.include CustomerHelpers
  config.include SubscriptionHelpers
  config.include MerchantAccountHelpers
  config.include FakeBraintree::Helpers

  config.before do
    FakeBraintree.clear!
    FakeBraintree.verify_all_cards = false
  end
end
