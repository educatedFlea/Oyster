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
      card = Oystercard.new(45)
      expect{card.top_up(50)}.to raise_error 'The balance has exceeded the limit'
    end 
  end   
end 