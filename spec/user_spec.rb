require './lib/user'

describe User do

  let(:station) { double :docking_station}
  let(:bike) { double :bike}
  let(:user_without_bike) { User.new }
  let(:user_with_bike) { User.new(bike) }

  it 'should not be initialized with a bike' do
    expect(user_without_bike).not_to have_bike
  end

  it 'can have a bike' do
    expect(user_with_bike).to have_bike
  end

  it 'can break a bike by having an accident' do
    expect(bike).to receive(:break!)
    user_with_bike.have_accident!
  end

  it 'can lose a bike' do
    user_with_bike.lose_bike!
    expect(user_with_bike).not_to have_bike
  end

  it 'can rent a bike from a docking station' do
    expect(station).to receive(:release).with(bike)
    user_without_bike.rent_bike_from(bike, station)
  end
end

#Can Rent a bike
#Has the bike after renting it
#can dock bike in docking station
#doesnt have the bike after docking it