require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'pry'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.default_driver = :selenium
describe "Buying BlizzCon tickets" do

  unavailable_host = "http://www.eventbrite.com/e/blizzcon-november-7-8-2014-tickets-10559318205"
  available_host = "http://www.eventbrite.com/e/maker-faire-bay-area-2014-tickets-9098302267?aff=ehometext&rank=0"

  context "when unavailable" do
    Capybara.app_host = unavailable_host

    it "fails to buy tickets" do
      5.times do
        expect(page.has_css?('.quantity_td')).to be_false
        sleep 1
      end
    end
  end

  context "when available" do
    Capybara.app_host = unavailable_host

    it "buys tickets" do
      while(true) do
        try_to_buy
        sleep 1
      end
      # try_to_buy
      # within '.quantity_td' do
        # expect(page).to have_content '2'
        # binding.pry
      # end
    end
  end

  def available?
    page.has_css?("#paidButton")
  end

  def choose_tickets
    within page.first '#TicketReg .ticket_row' do
      select '2'
    end
  end

  def try_to_buy
    visit ""
    if available?
      choose_tickets
      click_link 'Order Now'
    end
  end
end

