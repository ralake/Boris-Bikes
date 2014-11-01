require 'docking_station'

describe DockingStation do

  it_behaves_like BikeContainer

  let(:station) { DockingStation.new(:capacity => 123) }
  let(:van) { double :van }
  let(:broken_bike) { double :bike, { :is_a? => true, :broken? => true} }

  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

end