class Oystercard 
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  attr_accessor :balance, :MAXIMUM_BALANCE, :in_journey
  
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
  
  def in_journey?
    @in_journey 
  end  
  
  def touch_in
    @in_journey = true
  end 
  
  def touch_out
    @in_journey = false
  end 
end 