class DockingStation
attr_reader :bike
  #def bike
    #@bike
  #end
  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail 'Docking staion full' if @bikes.count >= 20
    @bikes << bike
  end

  def bike
    @bike
  end
end



#puts docking_station = DockingStation.new
#puts bike = Bike.new
#puts docking_station.dock_bike(bike)
#puts docking_station.bike
