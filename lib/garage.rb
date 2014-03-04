require 'bike_container'

class Garage
  
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  module GarageExtensions
    def dock(bike)
      super
      bike.fix
    end  
  end

  prepend GarageExtensions

end