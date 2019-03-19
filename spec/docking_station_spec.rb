require 'docking_station'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike) }

#the # before a method name shows its an instance method
  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      #we want to release the bike we docked
      expect(subject.release_bike).to eq bike
    end
  end

  it {is_expected.to respond_to(:dock_bike)}

  it {is_expected.to respond_to(:bikes)}

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  describe '#dock_bike' do
    it 'raises an error when the docking station is full' do
      20.times {subject.dock_bike Bike.new}
      expect {subject.dock_bike Bike.new}.to raise_error RuntimeError, 'Docking staion full'
    end
    it 'returns docked bikes' do
      bike = Bike.new
      expect(subject.dock_bike(bike)).to eq [bike]
    end
  end
end
