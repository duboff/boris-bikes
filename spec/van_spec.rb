require 'van'
require 'docking_station'

describe Van do 
  let(:van) {Van.new}
  
  let(:station) {DockingStation.new}
  it 'should collect broken bikes from station' do 
    broken_bike = Bike.new
    broken_bike.break
    station.dock(broken_bike)
    expect(station.broken_bikes).to eq [broken_bike]
    van.collect(station)
    expect(station.broken_bikes).to be_empty
    expect(van.bikes).to eq [broken_bike]
  end
end