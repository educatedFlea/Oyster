class Oystercard 
  DEFAULT_BALANCE = 0
  attr_accessor :balance, :amount
  
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end 

  def top_up(amount)
    @balance_after_top_up = @balance + amount
    fail 'The balance has exceeded the limit' if exceeded_limit?
    @balance += amount
  end

  def exceeded_limit?
    if @balance_after_top_up > 90
      exceeded_limit = true
    else 
      exceeded_limit = false 
    end 
  end 
end 