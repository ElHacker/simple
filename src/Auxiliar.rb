# Author: Teodoro Vargas Cortes A00808903
# Auxiliar class for the parser

require 'Queue.rb'
require 'Stack.rb'
require 'Cuadruples.rb'

class Auxiliar

  attr_accessor :global, :procedures, :operands_stack, :operations_stack,
    :jumps_stack, :lines_counter, :cuadruples_array, :scope_location,
    :sign_variable, :next_temp, :semanthic_cube

  # Constructor of the class
  def initialize
    @global = Hash.new
    @procedures = Hash.new
    @operands_stack = Stack.new
    @operations_stack = Stack.new
    @jumps_stack = Stack.new
    @lines_counter = 0
    @cuadruples_array = []
    @scope_location = nil
    @sing_variable = nil
    @next_temp = 1
    @semanthic_cube = {
    'int' => {
      'int' => {
	'=' => 'int',
	'+' => 'int',
	'-' => 'int',
	'*' => 'int',
	'/' => 'int',
	'and' => 'boolean',
	'or' => 'boolean',
	'>' => 'boolean',
	'>=' => 'boolean',
	'<' => 'boolean',
	'<=' => 'boolean',
	'==' => 'boolean',
	'!=' => 'boolean'
      },
      'float' => {
	'=' => 'int', 
	'+' => 'float',
	'-' => 'float',
	'*' => 'float',
	'/' => 'float',
	'and' => 'boolean',
	'or' => 'boolean',
	'>' => 'boolean',
	'>=' => 'boolean',
	'<' => 'boolean',
	'<=' => 'boolean',
	'==' => 'boolean',
	'!=' => 'boolean'
      },
      'boolean' => {
	'=' => 'int', 
	'and' => 'boolean',
	'or' => 'boolean'
      },
      'not' => 'boolean'
    },
    'float' => {
      'int' => {
	'=' => 'float',
	'+' => 'float',
	'-' => 'float',
	'*' => 'float',
	'/' => 'float',
	'and' => 'boolean',
	'or' => 'boolean',
	'>' => 'boolean',
	'>=' => 'boolean',
	'<' => 'boolean',
	'<=' => 'boolean',
	'==' => 'boolean',
	'!=' => 'boolean'
      },
      'float' => {
	'=' => 'float',
	'+' => 'float',
	'-' => 'float',
	'*' => 'float',
	'/' => 'float',
	'and' => 'boolean',
	'or' => 'boolean',
	'>' => 'boolean',
	'>=' => 'boolean',
	'<' => 'boolean',
	'<=' => 'boolean',
	'==' => 'boolean',
	'!=' => 'boolean'
      },
      'boolean' => {
	'=' => 'float', 
	'and' => 'boolean',
	'or' => 'boolean'
      },
      'not' => 'boolean'
    },
    'string' => {
      'string' => {
	'=' => 'string',
	'+' => 'string'
      }
    },
    'boolean' => {
      'int' => {
	'=' => 'boolean', 
      },
      'float' => {
	'=' => 'boolean', 
      },
      'boolean' => {
	'=' => 'boolean',
	'and' => 'boolean',
	'or' => 'boolean'
      },
      'not' => 'boolean'
    }
  }
  end

  # Adds a procedure to the global table.
  # The name of the procedure is obtained through @scope_location, for reasons of flexibility
  # Params:
  # +arguments+:: Information of the arguments of the function: id, type, isRef
  # +ret_type+:: Information of the returning type 
  def addProcedure(arguments, ret_type)
    if not @procedures.has_key?(@scope_location)
      @procedures[@scope_location] = { id: @scope_location, args: arguments, local_vars: Hash.new, return_type: ret_type }
    else
      abort("\nERROR: Procedure #{@scope_location} already defined\n")
    end
  end

  # Adds a variable to the corresponding table of variables (global o local)
  # Params:
  # +var_info+:: Information of the variable, a dictionary with the following
  # information: id, type, value (address in the virtual machine)
  def addVariable(var_info)
    if @scope_location == nil
      if @global.has_key?(var_info[:id])
    	abort("\nERROR: Variable #{var_info[:id]} already defined in global\n")
      else
    	@global[var_info[:id]] = var_info
      end
    else
      if @procedures[@scope_location][:local_vars].has_key?(var_info[:id])
    	abort("\nERROR: Variable #{var_info[:id]} already defined in #{@scope_location}\n")
      else
    	@procedures[@scope_location][:local_vars][var_info[:id]] = var_info
      end
    end
  end

  # Adds a variable to the stack of operands, by checking it's scope
  # Params:
  # +id+:: Identifier of the variable
  def addVariableToOperadStack(id)
    if not @scope_location.nil? and @procedures.has_key?(@scope_location)
      if @procedures[@scope_location][:local_vars].has_key?(id)
    	@operands_stack.push(@procedures[@scope_location][:local_vars][id])
      elsif @global.has_key?(id)
	@operands_stack.push(@global[id])
      else
	abort("Variable not defined in the program: #{id}")
      end
    else
      if @global.has_key?(id)
    	@operands_stack.push(@global[id])
      else
	abort("Variable not defined in the program: #{id}")
      end
    end
  end

  # Checks if the next cuadruple is valid and return the resulting type
  # Params:
  # +next_operation+:: Operation to be applied
  # +oper1+:: Operand number 1
  # +oper2+:: Operand number 2
  # Return:
  # +resulting_type+:: Resulting type of the semanthic cube
  def checkCuadruple(next_operation, oper1, oper2=nil)
    if oper2.nil?
      # Abort if the unary operation cannot be applyed
      abort("\nERROR: cannot apply '#{next_operation}' to #{oper1[:id]} aka '#{oper1[:type]}'\n") if @semanthic_cube[oper1[:type]][next_operation].nil?
      return @semanthic_cube[oper1[:type]][next_operation]
    else
      # Abort if the data types are not compatibles
      abort("\nERROR: type mismatch with #{oper1[:id]} aka '#{oper1[:type]}' and #{oper2[:id]} aka '#{oper1[:type]}'\n") if @semanthic_cube[oper1[:type]][oper2[:type]].nil?
      resulting_type = @semanthic_cube[oper1[:type]][oper2[:type]][next_operation]
      # Abort if the operand cannot be applyed to the data types
      abort("\nERROR: cannot apply '#{next_operation}' to #{oper1[:id]} aka '#{oper1[:type]}' and #{oper2[:id]} aka '#{oper2[:type]}'\n") if resulting_type.nil?
      # Emit a warning when casting is necessary
      print("\nWARNING: '#{resulting_type}' to '#{oper1[:type]}'\n") if oper1[:type] != resulting_type
      return resulting_type
    end
  end

  # Return the address of the next temporal variable, according with the data type
  # Params:
  # +type+:: Expeceted type of the temporal variable
  def nextTemporalVariable(type)
    # TODO: Implement according with the virtual machine
  end

  # Finds and return the information for a variable identifier
  # If the variable is not found, then abort the program
  def findVariable(id)
    found = false
    var = nil
    if not @scope_location.nil? && @procedures.has_key?(@scope_location)
      if @procedures[@scope_location][:local_vars].has_key?(id)
	var = @procedures[@scope_location][:local_vars][id]
	found = true
      elsif @global.has_key?(id)
	var = @global[id]
	found = true
      end
    elsif @global.has_key?(id)
      var = @global[id]
      found = true
    end
    if found
      return var
    else
      abort("\nERROR: Variable #{id} is not defined\n")
    end
  end

end
