require 'pry'

class Buyer
  def initialize(page)
    @page = page
  end

  def watch
    while true
      @page.visit ""
      if available?
        try_to_buy
        puts "I did my best, hope you got it!"
        binding.pry
      end
    end
  end

  def try_to_buy
    choose_tickets
    @page.click_link 'Order Now'
  end

  private
  def available?
    @page.has_css?("#paidButton")
  end

  def choose_tickets
    @page.within('#TicketReg .ticket_row', match: :first) do
      @page.select '1'
    end
  end
end