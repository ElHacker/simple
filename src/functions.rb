
@members {
  def addProcedure(ident, arguments, ret_type)
    if not $vars_block::procedures.has_key?(ident)
      $vars_block::procedures[ident] = { id: ident, args: arguments, local_vars: Hash.new, return_type: ret_type }
    else
      abort("\nERROR: Procedure #{ident} already defined\n")
    end
  end

  def addVariable(var_info)
    scope_location = $vars_block::scope_location 
    if scope_location == nil
      if $vars_block::global.has_key?(var_info[:id])
    	abort("\nERROR: Variable #{var_info[:id]} already defined in global\n")
      else
    	$vars_block::global[var_info[:id]] = var_info
      end
    else
      if $vars_block::procedures[scope_location][:local_vars].has_key?(var_info[:id])
    	abort("\nERROR: Variable #{var_info[:id]} already defined in #{scope_location}\n")
      else
    	$vars_block::procedures[scope_location][:local_vars][var_info[:id]] = var_info
      end
    end
  end

  def addArgumentsToProcedure(arguments, scope_location)
    if not $vars_block::procedures.has_key?(scope_location)
      abort("\nERROR: Procedure not declared\n")
    else if not $vars_block::procedures[scope_location].args.empty?
      abort("\nERROR: Procedure already have arguments\n")
    else
      $vars_block::procedures[scope_location].args = arguments
    end
  end

  def addVariableToOperadStack(id)
    scope_location = $vars_block::scope_location
    if not scope_location.nil? and $vars_block::procedures.has_key?(scope_location)
      if $vars_block::procedures[scope_location][:local_vars].has_key?(id)
    	$vars_block::operands_stack.push($vars_block::procedures[scope_location][:local_vars][id])
      end
    else
      if $vars_block::global.has_key?(id)
    	$vars_block::operands_stack.push($vars_block::global[id])
      else
	abort("Variable not defined in the program: #{id}")
      end
    end
  end
}
