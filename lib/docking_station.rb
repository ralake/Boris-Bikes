#load BikeContainer
require_relative 'bike_container'

class DockingStation

  # Gives us all of the methods that used to be in this class
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

end