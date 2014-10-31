require './lib/user'

describe User do

  let(:bike) { double :bike}
  let(:user_without_bike) { User.new }
  let(:user_with_bike) { User.new(bike) }

  it 'should not be initialized with a bike' do
    expect(user_without_bike).not_to have_bike
  end
  
end

#Can have a bike
#Can break a bike
#Can lose a bike
#Can Rent a bike
#Has the bike after renting it
#can dock bike in docking station
#doesnt have the bike after docking it