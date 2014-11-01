require_relative 'bike_container'

class Garage

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def fix_bikes
    bikes.map { |bike| bike.fix! }
  end

  def accept(bike)
    bike.fix!
    dock(bike)
  end

  # Method for interacting with van will be similar to van with station
  

end