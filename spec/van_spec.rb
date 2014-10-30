require './lib/van'

describe Van do
  
  let(:van) { Van.new(capacity: 10) }
  let(:bike) {Bike.new}
  let(:station) { DockingStation.new(capacity: 20) }

  it 'should receive broken bikes from the docking station' do
    bike.break!
    station.dock(bike)
    
  end

end