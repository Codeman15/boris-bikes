class DockingStation
attr_reader :bikes
::DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail 'Docking staion full' if full?
    @bikes << bike
  end

private

  def full?
    true if @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end


#puts docking_station = DockingStation.new
#puts bike = Bike.new
#puts docking_station.dock_bike(bike)
#puts docking_station.bike
