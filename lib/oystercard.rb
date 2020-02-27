class Oystercard 
  DEFAULT_BALANCE = 0
  MININUM_BALANCE_TO_TOUCH_IN = 1
  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90
  attr_accessor :balance, :entry_station, :exit_station, :travel_history
  
  def initialize(balance = DEFAULT_BALANCE)
    fail "Balance is below #{Oystercard::MAXIMUM_BALANCE}" if balance  > MAXIMUM_BALANCE
    @balance = balance
    @travel_history = []
  end 

  def top_up(amount)
    @amount = amount
    fail "The balance has exceeded the limit £#{Oystercard::MAXIMUM_BALANCE}" if exceed_max
    @balance += @amount
  end
  
  def in_journey?
    !!entry_station
  end  
  
  def touch_in(entry_station)
    fail "Balance is below #{Oystercard::MINIMUM_FARE}" if below_min
    @entry_station = entry_station
    @station_recorder = {}
    @station_recorder[:entry_station] = entry_station
  end 

  
  def touch_out(exit_station)
    @exit_station = exit_station
    @station_recorder[:exit_station] = exit_station
    @travel_history.push(@station_recorder)
    deduct
    @entry_station = nil
  end 

  private
  def exceed_max
    @balance + @amount > MAXIMUM_BALANCE
  end 
  def deduct(amount = MINIMUM_FARE)
    @balance -= amount
  end 
  def below_min
    @balance < MININUM_BALANCE_TO_TOUCH_IN
  end 

end 