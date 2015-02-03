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