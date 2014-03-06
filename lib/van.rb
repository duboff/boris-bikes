require 'bike_container'

class Van
  
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def collect_broken(station)
    station.broken_bikes.each {|bike| dock(bike)}
    station.release_broken
  end

  def release_bikes_to(container)
    bikes.each do |bike|
      container.dock(bike)
      release(bike)
    end
  end

  def collect_fixed(garage)
    garage.bikes.each do |bike| 
      self.dock(bike)
      garage.release(bike)
    end 
  end

end