class Oystercard 
  DEFAULT_BALANCE = 0
  MININUM_BALANCE_TO_TOUCH_IN = 1
  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90
  attr_accessor :balance, :MAXIMUM_BALANCE, :in_journey, :MININUM_BALANCE_TO_TOUCH_IN, :MINIMUM_FARE, :entry_station
  
  def initialize(balance = DEFAULT_BALANCE)
    fail 'The balance has exceeded the limit' if balance  > MAXIMUM_BALANCE
    @balance = balance
  end 

  def top_up(amount)
    fail 'The balance has exceeded the limit' if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end
  
  def in_journey?
    !!entry_station
  end  
  
  def touch_in(station)
    fail 'Balance is below minimum' if balance < MININUM_BALANCE_TO_TOUCH_IN
    @entry_station = station
  end 
  
  def touch_out
    deduct
    @entry_station = nil
  end 

  private
  def deduct
    @balance -= MINIMUM_FARE
  end 
end 