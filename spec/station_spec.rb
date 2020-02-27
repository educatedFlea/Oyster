require 'station'
RSpec.describe Station do 
 subject{described_class.new(name:'Crosshabour', zone:2)}

  it 'tells the station name' do 
    expect(subject.name).to eq 'Crosshabour'
  end 

  it 'tells the station zone' do 
    expect(subject.zone).to eq 2
  end 
end 