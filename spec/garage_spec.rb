require 'garage'

describe Garage do 
  let(:bike) {Bike.new}
  let(:garage) {Garage.new}

  it "should fix a broken bike when docked" do
    broken_bike = Bike.new
    working_bike = Bike.new
    broken_bike.break
    garage.dock(working_bike)
    garage.dock(broken_bike)
    expect(garage.available_bikes).to eq [working_bike, broken_bike]
  end

end
