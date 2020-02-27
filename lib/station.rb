class Station
  attr_accessor :name, :zone
  def initialize(name:name, zone: zone)
    @name = name
    @zone = zone
  end 
end 