class Van

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def move(bike, container_from, container_to)
    container_from.release(bike)
    container_to.dock(bike)
  end

  # def service_station(station)
  #   # then finish this test
  #   # van asks station if it has broken bikes. if it does it takes them
  #   # van asks itself if it has any working bikes. if it does it gives them to station
  # end

  def get_broken_bikes_from(station)
    self.bikes << station.bikes.select! {|bike| bike.broken?}
    station.bikes.delete_if {|bike| bike.broken? }
  end
  
end