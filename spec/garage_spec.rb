require './lib/bike_container'
require './lib/garage'
require './lib/bikes'

describe Garage do

  it_behaves_like BikeContainer

  let(:garage) {Garage.new(capacity: 200) }

  it "should allow setting default capacity on initialising" do
    expect(garage.capacity).to eq(200)
  end

  it 'can fix bikes that it holds' do
    bike = double("Bike", :is_a? => true, :fix! => true, :broken? => false)
    garage.dock(bike)
    garage.fix_bikes!
    expect(bike).not_to be_broken
    expect(garage.bikes).to eq garage.available_bikes
  end

end