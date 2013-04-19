# Author: Teodoro Vargas Cortes A00808903
# Map of a memory

require 'json'

# This class assumes that the map of the memory is the following order:
# integers
# floats
# booleans
# strings
# In the case of arrays, this values are sequence addresses of each type

class Memory

  # Attributes
  # attr_reader :int_init_addr, :float_init_addr, :boolean_init_addr, :string_init_addr,
  attr_reader :int_count, :float_count, :boolean_count, :string_count, :wide

  # Initialize a memory object
  # Params:
  # +init_address+:: Initial address of the memory block
  # +wide+:: Size of the total memory block
  # +distribution+:: A list especifian the distribution of the
  # memory, it must contain 4 elements. This argument is optional
  def initialize(init_address, wide, distribution = [0.25, 0.25, 0.25, 0.25])
    if distribution.length != 4
      abort("\nERROR: The distribution of the memory must have 4 spaces\n")
    end
    sum = 0.0
    distribution.each { |d|
      if d > 1 || d < 0
        abort("\nERROR: The distribution must be a value between 0.0 and 1.0\n")
      end
      sum += d
    }
    diff = sum - 1.0
    if diff.abs >= 0.0001
      abort("\nERROR: The sum of the distribution must be 1.0 and now it's #{diff}\n")
    end
    rang1 = distribution[0]
    rang2 = rang1 + distribution[1]
    rang3 = rang2 + distribution[2]
    @int_init_addr = init_address
    @float_init_addr = init_address + wide * rang1
    @boolean_init_addr = init_address + wide * rang2
    @string_init_addr = init_address + wide * rang3
    @wide = init_address + wide
    @int_count = 0
    @float_count = 0
    @boolean_count = 0
    @string_count = 0
  end

  # Get address for the next variable
  # If an error occurs, the program aborts
  # Params:
  # +type+:: A string indicating the data type of the next variable
  # +cant+:: Number of spaces needed. This argument is optional, its
  # default value is 1
  # Returns:
  # +address+:: The address of the next variable
  def getAddress(type, cant = 1)
    if cant <= 0
      abort("\nERROR: The amount of addresses cannot be 0 or negative\n")
    end
    case type
    when 'int'
      address = @int_init_addr + @int_count
      @int_count += cant
      if (@int_init_addr + @int_count) >= @float_init_addr
        abort("\nERROR: The directions for 'int' are finished\n")
      end
    when 'float'
      address = @float_init_addr + @float_count
      @float_count += cant
      if (@float_init_addr + @float_count) >= @boolean_init_addr
        abort("\nERROR: The directions for 'float' are finished\n")
      end
    when 'boolean'
      address = @boolean_init_addr + @boolean_count
      @boolean_count += cant
      if (@boolean_init_addr + @boolean_count) >= @string_init_addr
        abort("\nERROR: The directions for 'boolean' are finished\n")
      end
    when 'string'
      address = @string_init_addr + @string_count
      @string_count += cant
      if (@string_init_addr + @string_count) >= @wide
        abort("\nERROR: The directions for 'string' are finished\n")
      end
    else
      abort("\nERROR: No valid data type specified\n")
    end
    address
  end

  # Check if a given address is in this block
  # Params:
  # +address+:: The address to inspect
  # Returns:
  # true if it is in this block or false otherwise
  def checkAddress(address)
    if @int_init_addr <= address && address <= (@int_init_addr + @int_count)
      return true
    end
    if @float_init_addr <= address && address <= (@float_init_addr + @float_count)
      return true
    end
    if @boolean_init_addr <= address && address <= (@boolean_init_addr + @boolean_count)
      return true
    end
    if @string_init_addr <= address && address <= (@string_init_addr + @string_count)
      return true
    end
    false
  end

  # Reset the counter of this block memory
  def resetCounters()
    @int_count = 0
    @float_count = 0
    @boolean_count = 0
    @string_count = 0
  end

  # Returns a hash representation of the object
  def to_hash()
    return (Hash[ int_init_addr: @int_init_addr, float_init_addr: @float_init_addr,
      boolean_init_addr: @boolean_init_addr, string_init_addr: @string_init_addr,
      int_count: @int_count, float_count: @float_count, boolean_count: @boolean_count,
      string_count: @string_count])
  end

  # Returns a json representation of the object
  def to_json()
    return (Hash[ int_init_addr: @int_init_addr, float_init_addr: @float_init_addr,
      boolean_init_addr: @boolean_init_addr, string_init_addr: @string_init_addr,
      int_count: @int_count, float_count: @float_count, boolean_count: @boolean_count,
      string_count: @string_count]).to_json
    end

end
