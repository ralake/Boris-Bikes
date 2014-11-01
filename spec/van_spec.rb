require './lib/van'
require_relative 'bike_container_spec'

describe Van do

  it_behaves_like BikeContainer

  let(:van) { Van.new(capacity: 312) }
  let(:garage) {double :garage}
  let(:bike) {double :bike, {:broken? => true}}
  let(:station) {double :docking_station}
  
  it "should allow setting default capacity on initialising" do
    expect(van.capacity).to eq(312)
  end

end