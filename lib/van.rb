class Van

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def get_broken_bikes_from(station)
    self.bikes << station.bikes.select! { |bike| bike.broken? }
    station.bikes.delete_if {|bike| bike.broken? }
  end

  def give_fixed_bikes_to(station)
    station.bikes << self.bikes.select! { |bike| !bike.broken? }
    self.bikes.delete_if { |bike| !bike.broken? }
  end  

  # Above needs refactoring, possibly with garage methods.
  # Could clean all this up and have less code.
  
end