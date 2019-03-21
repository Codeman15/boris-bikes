class DockingStation
#when an instance of docking staion is created it has a capacity
# and the abilty to store bikes
def initialize(capacity = DEFAULT_CAPACITY)
  @capacity = capacity
  @bikes = []
end
#def bikes
#  @bikes
#end
attr_reader :bikes
#def capacity
#  @capacity
#end
attr_reader :capacity
::DEFAULT_CAPACITY = 20

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Bike is broken' unless @bikes.last.working?
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
