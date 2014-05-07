require 'rspec'
require 'capybara'
require 'capybara/dsl'
require_relative 'buyer'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.default_driver = :selenium
Capybara.app_host = "http://www.eventbrite.com/e/blizzcon-november-7-8-2014-tickets-10559318205"

describe "AIN'T NO TESTS IN HERE;" do
  it "TIME TO BUY SOME TICKETS" do
    @buyer = Buyer.new(page)
    @buyer.watch
  end
end



