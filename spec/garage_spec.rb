require './lib/bike_container'
require './lib/garage'
require './lib/bikes'

describe Garage do

  let(:garage) {Garage.new(capacity: 200) }
  let(:bike) {Bike.new}

  it "should allow setting default capacity on initialising" do
    expect(garage.capacity).to eq(200)
  end

  it 'can fix a bike' do
    bike.break!
    garage.dock(bike)
    garage.fix_bikes
    expect(garage.bikes).to eq garage.available_bikes
  end

  it 'will fix broken bikes on arrival' do
  bike.break!
  garage.accept(bike)
  expect(bike).not_to be_broken
  end

end