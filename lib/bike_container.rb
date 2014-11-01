class BikeNotHereError < Exception
  def message
    "This bike is not here"
  end
end

class HolderFullError < Exception
  def message
    "This holder is full"
  end
end

class NotABike < Exception
  def message
    "This is not a bike"
  end
end

module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  attr_writer :capacity

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
    bike_count == @capacity
  end

  def empty?
    bike_count == 0
  end

  def available_bikes
    @bikes.reject { |bike| bike.broken? }
  end

  def broken_bikes
    bikes.select { |bike| bike.broken? }
  end

  def give_broken_bikes_to(container)
    container.bikes << self.bikes.select! { |bike| bike.broken? }
    self.bikes.delete_if { |bike| bike.broken? }
  end

  def give_fixed_bikes_to(container)
    container.bikes << self.bikes.select! { |bike| !bike.broken? }
    self.bikes.delete_if { |bike| !bike.broken? }
  end

end
