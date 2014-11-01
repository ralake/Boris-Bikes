require_relative 'bike_container'

class Garage

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def fix_bikes!
    bikes.map { |bike| bike.fix! }
  end

  # Create get_broken_bikes_from(van) method and tests
  # Create give_fixed_bikes_to(van) method and tests
  
end