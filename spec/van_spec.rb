require './lib/van'
require './lib/docking_station'
require_relative 'bike_container_spec'

describe Van do

  it_behaves_like BikeContainer

  let(:van) { Van.new(capacity: 10) }
  let(:garage) {double :garage}
  let(:broken_bike) {double :bike, { :is_a? => true , :broken? => true} }
  let(:station) { DockingStation.new } 
  # let(:station) { double :docking_station}
  
  it "should allow setting default capacity on initialising" do
    expect(van.capacity).to eq(10)
  end

  it 'should pick up broken bikes from the docking station' do
    # expect(station).to receive(:dock)
    # expect(station).to receive(:bike_count)
    station.dock(broken_bike)
    expect(station.bike_count).to eq(1)
    van.get_broken_bikes_from(station)
    expect(van.bike_count).to eq(1)
    expect(station.bike_count).to eq(0)
    # Why does the bike count return nil for the docking station if it is a double?
  end

end