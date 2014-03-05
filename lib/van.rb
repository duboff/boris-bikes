require 'bike_container'

class Van
  
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def collect(station)
    station.broken_bikes.each {|bike| bikes << bike}
    station.release_broken
  end

end