class User

  def initialize(bike = nil)
    @bike = bike
  end

  def has_bike?
    @bike
  end

  def have_accident
    @bike.break
  end

  def lose_bike
    remove_bike
  end

  def rent(bike, station)
    @bike = station.release(bike)
  end

  def return(bike, station)
    station.dock(bike)
    remove_bike
  end

  private 
  
  def remove_bike
    @bike = nil
  end

end