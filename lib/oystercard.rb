class Oystercard 
  DEFAULT_BALANCE = 0
  MININUM_BALANCE_TO_TOUCH_IN = 1
  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90
  attr_accessor :balance, :MAXIMUM_BALANCE, :in_journey, :MININUM_BALANCE_TO_TOUCH_IN, :MINIMUM_FARE
  
  def initialize(balance = DEFAULT_BALANCE)
    fail 'The balance has exceeded the limit' if balance  > MAXIMUM_BALANCE
    @balance = balance
  end 

  def top_up(amount)
    fail 'The balance has exceeded the limit' if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  
  
  def in_journey?
    @in_journey 
  end  
  
  def touch_in
    fail 'Balance is below minimum' if balance < MININUM_BALANCE_TO_TOUCH_IN
    @in_journey = true
  end 
  
  def touch_out
    @in_journey = false
    deduct
  end 

  private
  def deduct
    @balance -= MINIMUM_FARE
  end 
end 