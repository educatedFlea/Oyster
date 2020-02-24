class Oystercard 
  DEFAULT_BALANCE = 0
  attr_accessor :balance
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end 
end 