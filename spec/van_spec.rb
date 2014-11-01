require './lib/van'
require './lib/docking_station'
require './lib/garage'
require_relative 'bike_container_spec'

describe Van do

  it_behaves_like BikeContainer

  let(:van) { Van.new(capacity: 10) }
  
  it "should allow setting default capacity on initialising" do
    expect(van.capacity).to eq(10)
  end

end