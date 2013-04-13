# Author: Teodoro Vargas Cortes A00808903
# Auxiliar class for the parser

require 'Queue.rb'
require 'Stack.rb'
require 'Cuadruples.rb'

class Auxiliar

  attr_accessor :global, :procedures, :operands_stack, :operations_stack,
    :jumps_stack, :lines_counter, :cuadruples_array, :scope_location,
    :arguments, :sign_variable, :next_temp, :semanthic_cube, :data_type,
    :is_ref, :has_return, :arg_stack, :call_stack, :exp_call

  # Constructor of the class
  def initialize
    @global = Hash.new
    @procedures = Hash.new
    @operands_stack = Stack.new
    @operations_stack = Stack.new
    @jumps_stack = Stack.new
    @lines_counter = 0
    @cuadruples_array = Array.new
    @scope_location = nil
    @sing_variable = nil
    @next_temp = 1
    @arguments = Array.new
    @data_type = nil
    @is_ref = false
    @has_return = false
    @exp_call = false
    @arg_stack = Stack.new
    @call_stack = Stack.new
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
  # The argumens of the procedure are obtained through @arguments, and
  # the returning type is obtained through @data_type
  def addProcedure()
    if not @procedures.has_key?(@scope_location)
      # Copy the arguments to a temporal Hash. If the argument is
      # a reference, then DO NOT create space for it in memory
      temp_vars = Hash.new
      @arguments.each { |arg|
        if not arg[:ref]
          # Increment the counter of variables according with the data type
        end
        temp_vars[arg[:id]] = arg.clone()
        temp_vars[arg[:id]].delete(:ref)
      }
      @procedures[@scope_location] = { id: @scope_location, args: @arguments.clone(),
        local_vars: temp_vars, return_type: @data_type, line: @lines_counter }
      # Also adds a global variable for the return data in case that the returning type is
      # diferent of void
      if @data_type != 'void'
        name = @scope_location + '_ret_swap'
        var_info = { id: name, type: @data_type, value: nil}
        @global[name] = var_info
      end
    else
      abort("\nERROR: Procedure '#{@scope_location}' already defined\n")
    end
  end

  # Adds a variable to the corresponding table of variables (global o local)
  # Params:
  # +var_info+:: Information of the variable, a dictionary with the following
  # +information+:: id, type, value (address in the virtual machine)
  def addVariable(var_info)
    if @scope_location.nil?
      if @global.has_key?(var_info[:id])
        abort("\nERROR: Variable '#{var_info[:id]}' already defined in global\n")
      else
        @global[var_info[:id]] = var_info
      end
    else
      in_arguments = false
      if not @procedures[@scope_location][:args].nil?
        @procedures[@scope_location][:args].each { |arg|
          if arg[:id] == var_info[:id]
            in_arguments = true
            break
          end
        }
      end
      if in_arguments
        abort("\nERROR: Local variable '#{var_info[:id]}' already defined in the arguments of '#{@scope_location}'\n")
      elsif @procedures[@scope_location][:local_vars].has_key?(var_info[:id])
        abort("\nERROR: Variable '#{var_info[:id]}' already defined in '#{@scope_location}'\n")
      else
        @procedures[@scope_location][:local_vars][var_info[:id]] = var_info
      end
    end
  end

  # Checks if an argument identifier is already in the arguments array
  # Params:
  # +id+:: Identifier of the argument
  def checkParamInArguments(id)
    in_arguments = false
    @arguments.each { |arg|
      if arg[:id] == id
        in_arguments = true
        break
      end
    }
    if in_arguments
      abort("\nERROR: Argument '#{id}' already defined in the arguments of '#{@scope_location}'\n")
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
  # Params:
  # +id+:: Identifier of the variable
  # Returns:
  # +var+:: Information of the variable
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
      abort("\nERROR: Variable '#{id}' is not defined\n")
    end
  end

  # Get the signature for a procedure given its identifier
  # Params:
  # +id+:: Identifier of the procedure
  # Returns:
  # +str+:: Description of the signature of the procedure
  def getSignature(id)
    if not @procedures.has_key?(id)
      return "#{id} doesn't exist"
    else
      info = @procedures[id]
      msg = "The signature is: #{info[:return_type]} #{info[:id]}("
      temp = []
      info[:args].each { |arg|
        str = "#{arg[:type]}"
        if arg[:ref]
          str = str + " &"
        end
        temp.push(str)
      }
      msg = msg + temp.join(",") + ")"
      return msg
    end
  end

end
