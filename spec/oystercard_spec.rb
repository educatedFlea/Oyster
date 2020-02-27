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
      expect{card.top_up(1)}.to raise_error "The balance has exceeded the limit £#{Oystercard::MAXIMUM_BALANCE}"
    end 
  end   
  
  describe '#touch_in' do
  let(:entry_station){double(:entry_station)} 
  let(:exit_station){double(:exit_station)} 
    # step1: before touching in, first ensure that the card is not in use
    it 'is initially not in use' do
      expect(subject).not_to be_in_journey
    end 
    # step2: after made sure the card is not in use, allow to touch in
    it 'can touch in if not already touched in' do
      card = Oystercard.new(10)
      card.touch_in(entry_station)
      expect(card).to be_in_journey
    end 

    it 'cannot touch in when balance is below minimum balance' do
      card = Oystercard.new(0.5)
      expect{card.touch_in(entry_station)}.to raise_error "Balance is below #{Oystercard::MINIMUM_FARE}"
    end 
    
    it 'record the station when you touch in' do
      card = Oystercard.new(10)
      card.touch_in(entry_station)
      expect(card.entry_station).to eq entry_station
    end 
  end 
  
  describe '#touch_out' do 
  let(:entry_station){double(:entry_station)} 
  let(:exit_station){double(:exit_station)} 
    it 'can touch out' do
      card = Oystercard.new(10)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card).not_to be_in_journey
    end

    it 'update the balance by deducting the minimum fare £1 when touch out' do
    card = Oystercard.new(10)
    card.touch_in(entry_station)
    expect{card.touch_out(exit_station)}.to change {card.balance}.by(-Oystercard::MINIMUM_FARE)
    end 

    it 'record station when touch out' do 
      card = Oystercard.new(10)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.exit_station).to eq exit_station
    end 
  end 
  
  describe '#travel_history' do
    let(:travel_history) {{entry_station:entry_station, exit_station:exit_station}}
    let(:entry_station){double(:entry_station)} 
    let(:exit_station){double(:exit_station)} 
  
    it 'track a complete travel (in&out)' do
      card = Oystercard.new(10)
      card.touch_in("Crosshabour")
      card.touch_out("Old Street")
      expect(card.travel_history).to eq [{entry_station:"Crosshabour", exit_station:"Old Street"}]
    end 
  end   
end 
