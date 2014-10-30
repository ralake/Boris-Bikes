require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
  
  let(:bike) { Bike.new }
  let(:bike2) { Bike.new }
  let(:holder) { ContainerHolder.new }

  def fill_holder(holder)
    holder.capacity.times { holder.dock(Bike.new) }
  end

  it 'should only interact with bikes' do
    expect{ holder.dock(:not_a_bike) }.to raise_error(NotABike)
  end

  it 'should accept a bike' do
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end

  it 'should release a bike' do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it 'should not release a bike that is not there' do
    holder.dock(bike)
    expect{ holder.release(bike2) }.to raise_error(BikeNotHereError)
  end

  it 'should know when it is full' do
    expect(holder).not_to be_full
    fill_holder(holder)
    expect(holder).to be_full
  end

  it 'should not accept a bike if it is full' do
  fill_holder(holder)
  expect{ holder.dock(bike) }.to raise_error(HolderFullError)
  end

  it 'should provide a list of the available bikes' do
  broken_bike, working_bike = Bike.new, Bike.new
  broken_bike.break!
  holder.dock(broken_bike)
  holder.dock(working_bike)
  expect(holder.available_bikes).to eq ([working_bike])  
  end

end