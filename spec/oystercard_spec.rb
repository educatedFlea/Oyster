require 'oystercard'

RSpec.describe Oystercard do 
  describe '#initialize' do
    it 'has a default balance of zero' do 
      expect(subject.balance).to eq 0 
    end
  end 
  
  describe '#top_up' do
    it {is_expected.to respond_to(:top_up).with(1).argument}
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
    it {is_expected.to respond_to(:deduct).with(1).argument}

    it 'deducts the fare £2.4 per travel' do
      card = Oystercard.new(5)
      expect{card.deduct 2.4}.to change { card.balance }.by (-2.4)
    end  
  end 
  
  describe '#touch_in' do
    # step1: before touching in, first ensure that the card is not in use
    it 'is initially not in use' do
      expect(subject).not_to be_in_journey
    end 
    # step2: after made sure the card is not in use, allow to touch in
    it 'can touch in if not already touched in' do
      subject.touch_in
      expect(subject).to be_in_journey
    end 
  end 
  
  describe '#touch_out' do 
    it 'can touch out' do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end 
end 