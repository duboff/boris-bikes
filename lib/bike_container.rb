module BikeContainer

  DEFAULT_CAPACITY = 20

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    raise "Station is full" if full?
    raise "Need to enter a bike to dock" if bike.nil?
    raise "The argument passed is wrong" if !bike.is_a?(Bike)
    bikes << bike
  end

  def release
    # raise "This bike is not in the container" if !bikes.include?(bike) && bike.is_a?(Bike)
    # raise "Need to enter a bike to release" if bike.nil?
    # raise "The argument passed is wrong" if !bike.is_a?(Bike)
    bikes.pop
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject {|bike| bike.broken? }
  end
end