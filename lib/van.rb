class Van

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def get_broken_bikes_from(station)
    # Why does .select! not alter the array in station? should alter the original and so wouldnt need the second line of code in the method
    bikes << station.bikes.select! { |bike| bike.broken? }
    station.bikes.delete_if {|bike| bike.broken? }
  end

  def give_fixed_bikes_to(station)
    station.bikes << bikes.select! { |bike| !bike.broken? }
    self.bikes.delete_if { |bike| !bike.broken? }
  end  

  # Above needs refactoring once garage methods are created, The methods will have the same name and function so can go in container module
  
end