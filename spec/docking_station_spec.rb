require 'docking_station'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike) }

#the # before a method name shows its an instance method
  describe '#release_bike' do
    it 'releases a bike' do
      bike = double(:bike)
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
    it 'docking station not to release broken bike' do
      bike = double(:bike)
      bike.report_broken
      subject.dock_bike(bike)
      expect{subject.release_bike}.to raise_error 'Bike is broken'
    end
  end

  describe '#dock_bike' do
    it 'raises an error when the docking station is full' do
      ::DEFAULT_CAPACITY.times {subject.dock_bike double(:bike)}
      expect {subject.dock_bike double(:bike)}.to raise_error RuntimeError, 'Docking staion full'
    end
    it 'returns docked bikes' do
      bike = double(:bike)
      expect(subject.dock_bike(bike)).to eq [bike]
    end
  end

  describe '#initialize' do
    it 'accept a capacity when initializing' do
      ds = DockingStation.new(30)
      expect(ds.capacity).to eq (30)
    end

    it 'default capacity should be DEFAULT_CAPACITY' do
      expect(subject.capacity).to eq ::DEFAULT_CAPACITY
    end
  end
end
