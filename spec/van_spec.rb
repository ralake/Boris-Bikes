require './lib/van'
require './lib/docking_station'
require './lib/garage'
require_relative 'bike_container_spec'

describe Van do

  it_behaves_like BikeContainer

  let(:van) { Van.new(capacity: 10) }
  # let(:garage) { double :garage }
  let(:garage) { Garage.new }
  let(:broken_bike) { double :bike, { :is_a? => true , :broken? => true} }
  let(:working_bike) { double :bike, { :is_a? => true, :broken? => false } }
  let(:station) { DockingStation.new } 
  # let(:station) { double :docking_station}
  
  it "should allow setting default capacity on initialising" do
    expect(van.capacity).to eq(10)
  end

  it 'should get broken bikes from the docking station' do
    station.dock(broken_bike)
    van.get_broken_bikes_from(station)
    expect(van.bike_count).to eq(1)
    expect(station.bike_count).to eq(0)
    # Why does the bike count return nil for the docking station if it is a double?
  end

  it 'should give fixed bikes to the docking station' do
     # Why does the bike count return nil for the docking station if it is a double?
    van.dock(working_bike)
    van.give_fixed_bikes_to(station)
    expect(station.bike_count).to eq(1)
    expect(van.bike_count).to eq(0)
  end

end