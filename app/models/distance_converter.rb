class DistanceConverter
  attr_reader :distance

  def initialize(distance)
    @distance = distance
  end

  def miles
    distance / 1609.34
  end

end
