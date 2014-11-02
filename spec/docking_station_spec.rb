require 'docking_station'

describe DockingStation do

  it_behaves_like BikeContainer

  it "should allow setting default capacity on initialising" do
    station = DockingStation.new(capacity: 123)
    expect(station.capacity).to eq(123)
  end

end