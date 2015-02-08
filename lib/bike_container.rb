require 'exceptions'

module BikeContainer

  attr_writer :capacity

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    raise NotABike unless bike.is_a?(Bike)
    raise HolderFullError if full?
    @bikes << bike
  end

  def release(bike)
    raise BikeNotHereError unless bikes.include?(bike)
    bikes.delete(bike)
  end

  def full?
    bike_count >= @capacity
  end

  def empty?
    bike_count == 0
  end

  def available_bikes
    @bikes.reject { |bike| bike.broken? }
  end

  def broken_bikes
    @bikes.select { |bike| bike.broken? }
  end

  def give_broken_bikes_to(container)
    container.class == DockingStation ? return : get_broken_bikes(container) 
  end

  def get_broken_bikes(container)
    broken_bikes.each { |bike| container.dock(bike); release(bike) } unless container.full?
  end


  def give_fixed_bikes_to(container)
    available_bikes.each { |bike| container.dock(bike); release(bike) } unless container.full?
  end

end
