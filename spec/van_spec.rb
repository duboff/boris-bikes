require 'van'
require 'docking_station'

describe Van do 
  let(:van) {Van.new}
  
  let(:station) {DockingStation.new}
  let(:garage) {Garage.new}

  it 'should collect broken bikes from station' do 
    broken_bike = Bike.new
    broken_bike.break
    station.dock(broken_bike)
    expect(station.broken_bikes).to eq [broken_bike]
    van.collect_broken(station)
    expect(station.broken_bikes).to be_empty
    expect(van.bikes).to eq [broken_bike]
  end

  it 'should release bikes' do 
    bike = Bike.new
    van.dock(bike)
    van.release_bikes_to(station)
    expect(van.bikes).to be_empty
    expect(station.bikes).to eq [bike]
  end

  it 'shoudld collect fixed bikes from garage' do 
    bike = Bike.new
    garage.dock(bike)
    van.collect_fixed(garage)
    expect(van.bikes).to eq [bike]
    expect(garage.bikes).to be_empty
  end

  it 'should not accept new bikes when full' do 
    20.times {van.dock(Bike.new)}
    broken_bike = Bike.new
    broken_bike.break
    station.dock(broken_bike)
    expect(lambda { van.collect_broken(station) }).to raise_error(RuntimeError)
  end
end