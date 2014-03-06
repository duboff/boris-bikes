require 'container_holder'

describe ContainerHolder do
  let(:bike) {Bike.new}
  let(:holder) {ContainerHolder.new} 
  
  def fill_holder(holder)
    20.times { holder.dock(Bike.new) }
  end

 it "should accept a bike" do 
  expect(holder.bike_count).to eq 0
  holder.dock(bike)
  expect(holder.bike_count).to eq 1
 end
  
 it "should release bikes" do 
  holder.dock(bike)
  expect(holder.bike_count).to eq 1
  holder.release #(bike) - trying alternative release without an arg
  expect(holder.bike_count).to eq 0
 end

 it "should know when it's full" do 
  expect(holder).not_to be_full
  fill_holder(holder)
  expect(holder).to be_full
 end

 it "should not accept a bike when full" do 
  fill_holder(holder)
  expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
 end

  it "should provide the list of available bikes" do 
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    holder.dock(broken_bike)
    holder.dock(working_bike)
    expect(holder.available_bikes).to eq [working_bike]
  end

  # disabled while trying a release method with no arg
  # it "should not release a bike that's not in contianer" do 
  #   expect(lambda { holder.release(Bike.new) }).to raise_error(RuntimeError)
  # end

  # it "should raise error if arg is empty" do 
  #   expect(lambda { holder.release() }).to raise_error(ArgumentError)
  # end
  
  # it "should raise error if arg is not a bike" do 
  #   expect(lambda { holder.release(2) }).to raise_error(RuntimeError)
  # end

  it "should raise error if arg is empty" do 
    expect(lambda { holder.dock() }).to raise_error(ArgumentError)
  end

  it "should raise error if arg is not a bike" do 
    expect(lambda { holder.dock(2) }).to raise_error(RuntimeError)
  end
end