# Author: Teodoro Vargas Cortes A00808903
# Map of a constant memory. This class includes hash for every type
# of data, wich helps to control the corresponding address directions

require 'Memory.rb'

class ConstantMemory

  # Attributes
  attr_reader :integers, :floats, :booleans, :strings

  # Initialize a constant memory object
  # Params:
  # +init_address+:: Initial address of the memory block
  # +wide+:: Size of the total memory block
  # +distribution+:: A list especifian the distribution of the
  # memory, it must contain 4 elements. This argument is optional
  def initialize(init_address, wide, distribution)
    @memory = Memory.new(init_address, wide, distribution)
    @integers = Hash.new
    @floats = Hash.new
    @booleans = Hash.new
    @strings = Hash.new
  end

  # Get address for the next constant
  # If an error occurs, the program aborts
  # Params:
  # +value+:: The value of the constant
  # +type+:: A string indicating the data type of the next variable
  # Returns:
  # +address+:: The address of the next variable
  def getAddress(value, type)
    case type
    when 'int'
      if not @integers.has_key?(value)
        @integers[value] = @memory.getAddress(type)
      end
      address = @integers[value]
    when 'float'
      if not @floats.has_key?(value)
        @floats[value] = @memory.getAddress(type)
      end
      address = @floats[value]
    when 'boolean'
      if not @booleans.has_key?(value)
        @booleans[value] = @memory.getAddress(type)
      end
      address = @booleans[value]
    when 'string'
      if not @strings.has_key?(value)
        @strings[value] = @memory.getAddress(type)
      end
      address = @strings[value]
    else
      abort("\nERROR: No valid data type specified\n")
    end
    address
  end

  def int_count
    @integers.size
  end

  def float_count
    @floats.size
  end

  def boolean_count
    @booleans.size
  end

  def string_count
    @strings.size
  end

end
