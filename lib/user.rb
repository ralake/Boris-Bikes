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

  def rent(bike, station)
    @bike = station.release(bike)
  end

  def return(bike, station)
    station.dock(bike)
  end

end