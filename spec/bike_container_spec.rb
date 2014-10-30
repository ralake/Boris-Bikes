require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
  
  let(:bike) { double :bike, { :is_a? => true } }
  let(:working_bike) { double :bike, { :is_a? => true, :broken? => false} }
  let(:broken_bike) { double :bike, { :is_a? => true, :broken? => true} }
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
    expect(holder.empty?).to be false
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it 'should not release a bike that is not there' do
    expect{ holder.release(bike) }.to raise_error(BikeNotHereError)
  end

  it 'should know when it is full' do
    expect(holder).not_to be_full
    fill_holder(holder)
    expect(holder).to be_full
  end

  it 'should know when it is empty' do
  expect(holder.empty?).to be true
  end

  it 'should not accept a bike if it is full' do
  fill_holder(holder)
  expect{ holder.dock(bike) }.to raise_error(HolderFullError)
  end

  it 'should provide a list of the available bikes' do
  holder.dock(broken_bike)
  holder.dock(working_bike)
  expect(holder.available_bikes).to eq ([working_bike])  
  end

end