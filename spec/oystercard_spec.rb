require 'oystercard'

RSpec.describe Oystercard do 
  describe '#initialize' do
    it 'has a default balance of zero' do 
      expect(subject.balance).to eq 0 
    end
 end 
  
  describe '#top_up' do
    it 'tops up' do
      card = Oystercard.new
      card.top_up(10)
      expect(card.balance).to eq 10
    end 

    it 'adds amount to current balance' do
      card = Oystercard.new(5)
      card.top_up(10)
      expect(card.balance).to eq 15
    end 

    it 'has a balance limit of £90' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      card = Oystercard.new(maximum_balance)
      expect{card.top_up(1)}.to raise_error 'The balance has exceeded the limit'
    end 
  end   

  describe '#deduct' do
    it 'deducts when touch out' do
    expect(subject).to respond_to(:deduct).with(1).argument
    end

    it 'deducts the fare £2.4 per travel' do
      card = Oystercard.new(5)
      expect{card.deduct 2.4}.to change { card.balance }.by (-2.4)
    end  
  end  
end 