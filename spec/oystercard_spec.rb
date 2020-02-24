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
  end   
end 