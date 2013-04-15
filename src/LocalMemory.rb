# Author: Teodoro Vargas Cortes, A00808903
# Map of a local memory, which consists of a
# regular and a temporal memory

require 'Memory.rb'

class LocalMemory

  # Attributes
  attr_reader :normal, :temporal

  # Initialize a local memory object
  # Divides the wide of the total memory in two equal segments
  # Params:
  # +init_address+:: Initial address of the memory block
  # +wide+:: Size of the total memory block
  # +distribution+:: A list especifian the distribution of the
  # memory, it must contain 4 elements. This argument is optional
  def initialize(init_address, wide, distribution = [0.25, 0.25, 0.25, 0.25])
    segment = wide / 2
    @normal = Memory.new(init_address, segment, distribution)
    @temporal = Memory.new(init_address + segment, segment, distribution)
  end


  # Get address for the next variable
  # If an error occurs, the program aborts
  # Params:
  # +type+:: A string indicating the data type of the next variable
  # +segment+:: A string indicating the segment of the memory to use.
  # Accepted values are: 'normal' and 'temporal'
  # +cant+:: Number of spaces needed. This argument is optional, its
  # default value is 1
  # Returns:
  # +address+:: The address of the next variable
  def getAddress(type, segment, cant = 1)
    if !['normal', 'temporal'].include?(segment)
      abort("\nERROR: You must specified the corresponding segment of the local memory\n")
    end
    case segment
    when 'normal'
      address = @normal.getAddress(type, cant)
    when 'temporal'
      address = @temporal.getAddress(type, cant)
    end
    address
  end

end
