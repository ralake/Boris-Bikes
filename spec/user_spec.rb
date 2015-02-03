require './lib/user'

describe User do

  let(:station)           { double :docking_station}
  let(:bike)              { double :bike}
  let(:user_without_bike) { User.new }
  let(:user_with_bike)    { User.new(bike) }

  it 'should not be initialized with a bike' do
    expect(user_without_bike).not_to have_bike
  end

  it 'can have a bike' do
    expect(user_with_bike).to have_bike
  end

  it 'can break a bike by having an accident' do
    expect(bike).to receive(:break)
    user_with_bike.have_accident
  end

  it 'can lose a bike' do
    user_with_bike.lose_bike
    expect(user_with_bike).not_to have_bike
  end

  it 'can rent a bike from a docking station' do
    expect(station).to receive(:release).with(bike)
    user_without_bike.rent(bike, station)
  end

  it 'has the bike after renting it' do
    expect(station).to receive(:release).with(bike).and_return(bike)
    user_without_bike.rent(bike, station)
    expect(user_without_bike).to have_bike
  end

  it 'can return the bike to the docking station' do
    expect(station).to receive(:dock).with(bike)
    user_with_bike.return(bike, station)
  end

  it 'does not have the bike once it has docked it to the station' do
    allow(station).to receive(:dock).with(bike)  
    user_with_bike.return(bike, station)
    expect(user_with_bike).not_to have_bike
  end

end