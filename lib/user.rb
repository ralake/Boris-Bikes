class User

  def initialize(bike = nil)
    @bike = bike
  end

  def has_bike?
    !@bike.nil?
  end

  def have_accident!
    @bike.break!
  end

  def lose_bike!
    @bike = nil
  end

  def rent_bike_from(bike, station)
    station.release(bike)
  end

end