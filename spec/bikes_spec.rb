require './lib/bike'

describe Bike do

  let(:bike) { Bike.new }
 
  it 'is not broken when created' do
    expect(bike).not_to be_broken
    expect(bike.broken?).to be false
  end

  it 'can break' do
    bike.break
    expect(bike).to be_broken
  end

end 
