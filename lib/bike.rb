class Bike
#when an instance of bike is create it is NOT broken
  def initialize
    @broken = false
  end
#def broken
#  @broken
#end
attr_reader :broken

  def working?
    !@broken
  end

  def report_broken
    @broken = true
  end
end
