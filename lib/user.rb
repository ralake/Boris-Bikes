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

end