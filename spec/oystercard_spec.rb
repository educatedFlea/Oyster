require 'oystercard'

RSpec.describe Oystercard do 
  describe '#initialize' do
    it 'has a default balance of zero' do 
      expect(subject.balance).to eq 0 
    end  
  end   
end 