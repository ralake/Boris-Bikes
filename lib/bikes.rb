class Bike

  def initialize
    fix!
  end

  def broken?
    @broken
  end

  def fix!
    @broken = false
  end

  def break!
    @broken = true
  end

end