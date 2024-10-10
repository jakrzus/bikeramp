class Meters
  def initialize(meters)
    @meters = meters || 0
  end

  def to_km
    (@meters.to_f / 1000).round(2)
  end
end
