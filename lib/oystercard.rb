class Oystercard 
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  attr_accessor :balance, :MAXIMUM_BALANCE
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end 

  def top_up(amount)
    fail 'The balance has exceeded the limit' if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end 
end 