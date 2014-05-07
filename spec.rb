require 'rspec'
require 'capybara'
require 'capybara/dsl'
require_relative 'buyer'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.default_driver = :selenium
Capybara.app_host = "http://www.eventbrite.com/e/maker-faire-bay-area-2014-tickets-9098302267?aff=ehometext&rank=0"

describe "#try_to_buy" do
  context "when available" do
    it "Adds tickets and starts the order" do
      page.visit ""
      Buyer.new(page).try_to_buy
      within '.quantity_td' do
        expect(page).to have_content '2'
      end
    end
  end


end

