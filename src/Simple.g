/*
 * Simple
 * A simple programming language
 * Author:
 * Braulio Vladimir Chavez Nunez, A00803220
 * Teodoro Vargas Cortes, A00808903
 */

grammar Simple;

options {
  language  = Ruby;
  backtrack = true;
}

@header {
  require 'Codes'
  require 'Auxiliar.rb'
  require 'Queue.rb'
  require 'Stack.rb'
  require 'Cuadruples.rb'
  require 'json'
}

/* Scanner Rules */
INT: 'int';
FLOAT: 'float';
BOOLEAN: 'boolean';
STRING: 'string';
ARRAY: 'array';
MAIN: 'main';
VOID: 'void';
FUNCTION: 'function';
RETURN: 'return';
FOR: 'for';
IF: 'if';
ELSE: 'else';
PRINT: 'print';
INPUT: 'input';
ASSIGN: '=';
LT: '<';
LE: '<=';
GT: '>';
GE: '>=';
EQ: '==';
NE: '!=';
NOT: 'not';
AND: 'and';
OR: 'or';
LBRACK: '{';
RBRACK: '}';
LPARENT: '(';
RPARENT: ')';
LSBRACK: '[';
RSBRACK: ']';
COMMA: ',';
REF: '&';
SEMICOLON: ';';
COLON: ':';
PLUS: '+';
MINUS: '-';
TIMES: '*';
DIVIDE: '/';
CTEI: DIGITS;
CTEF: DIGITS '.' DIGITS;
CTES: '"' (NormalChar)* '"';
CTEB: 'true' | 'false';
ID: Identifier;
WHITESPACE: ('\t' | ' ' | '\r' | '\n')+ { $channel = HIDDEN; };

fragment
Identifier
    : ('a'..'z' | 'A'..'Z')('a'..'z' | 'A'..'Z' | '_' | '0'..'9')*
    ;

fragment
SpecialChar
    : '"' | '\\'
    ;

fragment
NormalChar
    : ~SpecialChar
    ;

fragment
DIGITS
    : ('0'..'9')+
    ;

/* Parser Rules */
/* block to keep the recognized variables */
vars_block
scope {
  auxiliar;
}

@init {
  $vars_block::auxiliar = Auxiliar.new
}

/* Callback executed at the end of programa */
@after {
  if $vars_block::auxiliar.debug
    puts("\nFound this constants: \n")
    puts("\n\tIntegers:\n")
    \$integers = $vars_block::auxiliar.const_memory.integers
    \$integers.keys.each do | key |
      print("#{key} : #{\$integers[key]}\n")
    end
    puts("\n\tFloats:\n")
    \$floats = $vars_block::auxiliar.const_memory.floats
    \$floats.keys.each do | key |
      print("#{key} : #{\$floats[key]}\n")
    end
    puts("\n\tBooleans:\n")
    \$booleans = $vars_block::auxiliar.const_memory.booleans
    \$booleans.keys.each do | key |
      print("#{key} : #{\$booleans[key]}\n")
    end
    puts("\n\tStrings:\n")
    \$strings = $vars_block::auxiliar.const_memory.strings
    \$strings.keys.each do | key |
      print("#{key} : #{\$strings[key]}\n")
    end
    puts("Map of constant memory:\n")
    print("#{$vars_block::auxiliar.const_memory.to_json}\n")
    print("#{$vars_block::auxiliar.const_memory.values_to_json}\n")
  else
    #File.open($vars_block::auxiliar.filename, 'w') { | file |
    #  file.write("{ \"const_memory_map\": #{$vars_block::auxiliar.const_memory.to_json},\n")
    #  file.write(" \"const_memory_values\": #{$vars_block::auxiliar.const_memory.values_to_json},\n")
    #}
    print("{ \"const_memory_map\": #{$vars_block::auxiliar.const_memory.to_json},\n")
    print(" \"const_memory_values\": #{$vars_block::auxiliar.const_memory.values_to_json},\n")
  end

  if $vars_block::auxiliar.debug
    puts("\n\nFound this global variables: \n")
    \$global = $vars_block::auxiliar.global
    \$global.keys.sort.each do | key |
      \$var_info = \$global[key]
      print("#{key} : type=#{\$var_info[:type]}, value=#{\$var_info[:value]}\n")
    end
    puts("Map of global memory:\n")
    print($vars_block::auxiliar.global.to_json)
  else
    #File.open($vars_block::auxiliar.filename, 'a') { | file |
    #  file.write(" \"global_memory_map\": #{$vars_block::auxiliar.global_memory.to_json},\n")
    #  file.write(" \"global_memory_values\": #{$vars_block::auxiliar.global.to_json},\n")
    #}
    print(" \"global_memory_map\": #{$vars_block::auxiliar.global_memory.to_json},\n")
    print(" \"global_memory_values\": #{$vars_block::auxiliar.global.to_json},\n")
  end

  if $vars_block::auxiliar.debug
    puts("\n\nFound this functions: \n")
    \$functions = $vars_block::auxiliar.procedures
    \$functions.keys.sort.each do | key |
      \$proc_info = \$functions[key]
      print("#{key}: #{\$proc_info}\n")
    end
  else
    #File.open($vars_block::auxiliar.filename, 'a') { | file |
    #  file.write(" \"functions\": #{$vars_block::auxiliar.procedures.to_json},\n")
    #}
    print(" \"functions\": #{$vars_block::auxiliar.procedures.to_json},\n")
  end

  \$cont = 0
  \$cuadruples = $vars_block::auxiliar.cuadruples_array
  if $vars_block::auxiliar.debug
    puts("\n\nCuadruples:\n")
    \$cuadruples.each { | cuadruple |
      puts( "#{\$cont}: #{cuadruple.to_s}")
      \$cont += 1
    }
  else
    #File.open($vars_block::auxiliar.filename, 'a') { | file |
    #  file.write(" \"quadruples\": [\n")
    #  while \$cont < \$cuadruples.length do
    #    if \$cont == (\$cuadruples.length - 1)
    #      file.write(" \"#{\$cuadruples[\$cont].to_values}\"\n")
    #    else
    #      file.write(" \"#{\$cuadruples[\$cont].to_values}\",\n")
    #    end
    #    \$cont += 1
    #  end
    #  file.write("]}")
    #}
    print(" \"quadruples\": [\n")
    while \$cont < \$cuadruples.length do
      if \$cont == (\$cuadruples.length - 1)
        print(" \"#{\$cuadruples[\$cont].to_values}\"\n")
      else
        print(" \"#{\$cuadruples[\$cont].to_values}\",\n")
      end
      \$cont += 1
    end
    print("]}\n")
  end
}
  : programa
  ;


programa:
    var {
      # Cuadruple, go to the main procedure
      \$goto_line = Hash[ id: 'Goto', value: CODES::Codes[:GOTO] ]
      $vars_block::auxiliar.jumps_stack.push( $vars_block::auxiliar.lines_counter )
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$goto_line, \$empty, \$empty, \$empty)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
    } func main
    ;

var:
    | variables var
    ;

variables:
    INT ID assignint SEMICOLON {
      if $vars_block::auxiliar.scope_location.nil?
        \$address = $vars_block::auxiliar.global_memory.getAddress('int')
      else
        \$address = $vars_block::auxiliar.local_memory.getAddress('int', 'normal')
      end
      \$var_info = Hash[ id: $ID.text, type: $INT.text, value: \$address, array: false ]
      $vars_block::auxiliar.addVariable(\$var_info)
      if (! $vars_block::auxiliar.addr_const_val.nil?)
        \$action = Hash[ id: '=', value: CODES::Codes[:ASSIGN] ]
        \$empty = Hash[ value: -1 ]
        \$int_val = $vars_block::auxiliar.addr_const_val
        \$cuadruple = Cuadruples.new(\$action, \$int_val, \$empty, \$var_info)
        $vars_block::auxiliar.lines_counter += 1
        $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      end
    }
    | FLOAT ID assignfloat SEMICOLON {
      if $vars_block::auxiliar.scope_location.nil?
        \$address = $vars_block::auxiliar.global_memory.getAddress('float')
      else
        \$address = $vars_block::auxiliar.local_memory.getAddress('float', 'normal')
      end
      \$var_info = Hash[ id: $ID.text, type: $FLOAT.text, value: \$address, array: false ]
      $vars_block::auxiliar.addVariable(\$var_info)
      if (! $vars_block::auxiliar.addr_const_val.nil?)
        \$action = Hash[ id: '=', value: CODES::Codes[:ASSIGN] ]
        \$empty = Hash[ value: -1 ]
        \$float_val = $vars_block::auxiliar.addr_const_val
        \$cuadruple = Cuadruples.new(\$action, \$float_val, \$empty, \$var_info)
        $vars_block::auxiliar.lines_counter += 1
        $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      end
    }
    | STRING ID assignstring SEMICOLON {
      if $vars_block::auxiliar.scope_location.nil?
        \$address = $vars_block::auxiliar.global_memory.getAddress('string')
      else
        \$address = $vars_block::auxiliar.local_memory.getAddress('string', 'normal')
      end
      \$var_info = Hash[ id: $ID.text, type: $STRING.text, value: \$address, array: false ]
      $vars_block::auxiliar.addVariable(\$var_info)
      if (! $vars_block::auxiliar.addr_const_val.nil?)
        \$action = Hash[ id: '=', value: CODES::Codes[:ASSIGN] ]
        \$empty = Hash[ value: -1 ]
        \$string_val = $vars_block::auxiliar.addr_const_val
        \$cuadruple = Cuadruples.new(\$action, \$string_val, \$empty, \$var_info)
        $vars_block::auxiliar.lines_counter += 1
        $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      end
    }
    | BOOLEAN ID assignboolean SEMICOLON {
      if $vars_block::auxiliar.scope_location.nil?
        \$address = $vars_block::auxiliar.global_memory.getAddress('boolean')
      else
        \$address = $vars_block::auxiliar.local_memory.getAddress('boolean', 'normal')
      end
      \$var_info = Hash[ id: $ID.text, type: $BOOLEAN.text, value: \$address, array: false ]
      $vars_block::auxiliar.addVariable(\$var_info)
      if (! $vars_block::auxiliar.addr_const_val.nil?)
        \$action = Hash[ id: '=', value: CODES::Codes[:ASSIGN] ]
        \$empty = Hash[ value: -1 ]
        \$boolean_val = $vars_block::auxiliar.addr_const_val
        \$cuadruple = Cuadruples.new(\$action, \$boolean_val, \$empty, \$var_info)
        $vars_block::auxiliar.lines_counter += 1
        $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      end
    }
    | ARRAY tipo ID COLON CTEI SEMICOLON {
      \$size = $CTEI.text.to_i
      \$type = $vars_block::auxiliar.data_type
      if \$size <= 0
        abort("\nERROR: The size of the array must be greather than cero\n")
      end
      if $vars_block::auxiliar.scope_location.nil?
        \$address = $vars_block::auxiliar.global_memory.getAddress(\$type, \$size)
      else
        \$address = $vars_block::auxiliar.local_memory.getAddress(\$type, 'normal', \$size)
      end
      \$var_info = Hash[ id: $ID.text, type: \$type, value: \$address, array: true, size: \$size ]
      $vars_block::auxiliar.addVariable(\$var_info)
    }
    ;

assignint:
    /* empty */ {
      $vars_block::auxiliar.addr_const_val = nil
    }
    | ASSIGN CTEI {
      \$val = $CTEI.text.to_i
      $vars_block::auxiliar.addr_const_val = Hash[ id: \$val, value: $vars_block::auxiliar.const_memory.getAddress(\$val, 'int') ]
    }
    ;

assignfloat:
    /* empty */ {
      $vars_block::auxiliar.addr_const_val = nil
    }
    | ASSIGN CTEF {
      \$val = $CTEF.text.to_f
      $vars_block::auxiliar.addr_const_val = Hash[ id: \$val, value: $vars_block::auxiliar.const_memory.getAddress(\$val, 'float') ]
    }
    ;

assignstring:
     /* empty */ {
      $vars_block::auxiliar.addr_const_val = nil
    }
    | ASSIGN CTES {
      \$val = $CTES.text
      \$val.gsub!('"', '')
      $vars_block::auxiliar.addr_const_val = Hash[ id: \$val, value: $vars_block::auxiliar.const_memory.getAddress(\$val, 'string') ]
    }
    ;

assignboolean:
    /* empty */ {
      $vars_block::auxiliar.addr_const_val = nil
    }
    | ASSIGN CTEB {
      \$val = $CTEB.text == 'true'
      $vars_block::auxiliar.addr_const_val = Hash[ id: \$val, value: $vars_block::auxiliar.const_memory.getAddress(\$val, 'boolean') ]
    } /* Convert string to boolean */
    ;

tipo:
    INT { $vars_block::auxiliar.data_type = 'int' }
    | FLOAT { $vars_block::auxiliar.data_type = 'float' }
    | STRING { $vars_block::auxiliar.data_type = 'string' }
    | BOOLEAN { $vars_block::auxiliar.data_type = 'boolean' }
    ;

func:
    | funcion func
    ;

funcion:
    FUNCTION ID {
      $vars_block::auxiliar.scope_location = $ID.text
      $vars_block::auxiliar.has_return = false
      $vars_block::auxiliar.local_memory.resetCounters()
    } LPARENT argumentos RPARENT COLON retornofunc {
      $vars_block::auxiliar.addProcedure()
    } LBRACK var est RBRACK {
      $vars_block::auxiliar.arguments.clear()
      $vars_block::auxiliar.pointer_memory.resetCounters()
      # Checks if the procudure has a correct return
      \$scope_location = $vars_block::auxiliar.scope_location
      \$returning_type = $vars_block::auxiliar.procedures[\$scope_location][:return_type]
      if \$returning_type != 'void' && $vars_block::auxiliar.has_return == false
        abort("\nERROR: The procedure '#{\$scope_location}' must have a return statement\n")
      end
      # Insert the corresponding memory space in the procedure directory
      \$normal = $vars_block::auxiliar.local_memory.normal.to_hash
      \$temporal = $vars_block::auxiliar.local_memory.temporal.to_hash
      \$pointers = $vars_block::auxiliar.pointer_memory.to_hash
      \$memory = Hash[ normal: \$normal, temporal: \$temporal, pointers: \$pointers ]
      $vars_block::auxiliar.procedures[\$scope_location][:memory] = \$memory

      # This cuadruple is inserted in the case that the procedure does not have a
      # explicit return and the end of the procedure is reached

      # Create the Goend cuadruple
      \$action = Hash[ id: 'Goend', value: CODES::Codes[:GOEND] ]
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$action, \$empty, \$empty, \$empty)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
    }
    ;

argumentos: /* empty */
    | tipo ref ID {
      \$type = $vars_block::auxiliar.data_type
      \$ref = $vars_block::auxiliar.is_ref
      $vars_block::auxiliar.checkParamInArguments( $ID.text )
      $vars_block::auxiliar.arguments.push( Hash[ type: \$type, ref: \$ref, id: $ID.text, array: false ] )
    } argumentoaux
    | ARRAY tipo ID COLON CTEI {
      \$size = $CTEI.text.to_i
      \$type = $vars_block::auxiliar.data_type
      if \$size <= 0
        abort("\nERROR: The size of the array in '#{$vars_block::auxiliar.scope_location}' must be greather than cero\n")
      end
      $vars_block::auxiliar.checkParamInArguments( $ID.text )
      $vars_block::auxiliar.arguments.push( Hash[ type: \$type, ref: true, id: $ID.text, array: true, size: \$size ] )
    } argumentoaux
    ;

argumentoaux: /* empty */
    | COMMA tipo ref ID {
      \$type = $vars_block::auxiliar.data_type
      \$ref = $vars_block::auxiliar.is_ref
      $vars_block::auxiliar.checkParamInArguments( $ID.text )
      $vars_block::auxiliar.arguments.push( Hash[ type: \$type, ref: \$ref, id: $ID.text, array: false ] )
    } argumentoaux
    | COMMA ARRAY tipo ID COLON CTEI {
      \$size = $CTEI.text.to_i
      \$type = $vars_block::auxiliar.data_type
      if \$size <= 0
        abort("\nERROR: The size of the array in '#{$vars_block::auxiliar.scope_location}' must be greather than cero\n")
      end
      $vars_block::auxiliar.checkParamInArguments( $ID.text )
      $vars_block::auxiliar.arguments.push( Hash[ type: \$type, ref: true, id: $ID.text, array: true, size: \$size ] )
    } argumentoaux
    ;

ref: /* empty */ { $vars_block::auxiliar.is_ref = false }
    | REF { $vars_block::auxiliar.is_ref = true }
    ;

retornofunc:
    VOID { $vars_block::auxiliar.data_type = 'void' }
    | tipo
    ;

est:
    estatutos estaux
    ;

estaux: /* empty */
    | estatutos estaux
    ;

estatutos:
    ID {
      $vars_block::auxiliar.operands_stack.push($ID.text)
      $vars_block::auxiliar.exp_call = false
    } idestatutos SEMICOLON
    | condicion
    | escritura
    | ciclo
    | lectura
    | retorno
    ;

idestatutos:
    llamada
    | array ASSIGN {
      $vars_block::auxiliar.operations_stack.push( $ASSIGN.text )
    } expresion {
      \$next_operation = $vars_block::auxiliar.operations_stack.pop()
      \$operation_value = Hash[ id: \$next_operation, value: CODES.tokenValue(\$next_operation) ]
      \$oper1 = $vars_block::auxiliar.operands_stack.pop()
      \$oper2 = $vars_block::auxiliar.operands_stack.pop()
      $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper2, \$oper1)
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$operation_value, \$oper1, \$empty, \$oper2)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
    }
    | ASSIGN {
      \$id = $vars_block::auxiliar.operands_stack.pop()
      \$var = $vars_block::auxiliar.findVariable(\$id)
      $vars_block::auxiliar.operands_stack.push(\$var)
      $vars_block::auxiliar.operations_stack.push( $ASSIGN.text )
    } expresion {
      \$next_operation = $vars_block::auxiliar.operations_stack.pop()
      \$operation_value = Hash[ id: \$next_operation, value: CODES.tokenValue(\$next_operation) ]
      \$oper1 = $vars_block::auxiliar.operands_stack.pop()
      \$oper2 = $vars_block::auxiliar.operands_stack.pop()
      $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper2, \$oper1)
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$operation_value, \$oper1, \$empty, \$oper2)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
    }
    ;

llamada:
    LPARENT {
      \$procedure = $vars_block::auxiliar.operands_stack.pop()
      if (! $vars_block::auxiliar.procedures.has_key?(\$procedure))
        abort("\nERROR: Procedure '#{\$procedure}' not defined\n")
      end
      $vars_block::auxiliar.arg_stack.push(0)
      $vars_block::auxiliar.call_stack.push(\$procedure)
      # Era
      \$action = Hash[ id: 'Era', value: CODES::Codes[:ERA] ]
      \$empty = Hash[ value: -1 ]
      \$procedure_value = Hash[ value: \$procedure ]
      \$cuadruple = Cuadruples.new(\$action, \$procedure_value, \$empty, \$empty)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)

      # Puts and false bottom in the operations stack
      $vars_block::auxiliar.operations_stack.push( '|' )
    } llamadaargs RPARENT {
      # Extracts the false bottom of the operations stack
      $vars_block::auxiliar.operations_stack.pop()

      \$procedure = $vars_block::auxiliar.call_stack.pop()
      \$return_type = $vars_block::auxiliar.procedures[\$procedure][:return_type]
      \$call_in_exp = $vars_block::auxiliar.exp_call
      \$arg_number = $vars_block::auxiliar.arg_stack.pop()
      # Check if the numbers of passed arguments is equal to the size of
      # argument array in the procedure directory
      if \$arg_number != $vars_block::auxiliar.procedures[\$procedure][:args].length
        msg = "\nERROR: Passing different number of arguments for '#{\$procedure}'\n" +
          $vars_block::auxiliar.getSignature(\$procedure)
        abort(msg)
      end
      # Now, check the returning type and if the function is called in a expression
      if \$return_type == 'void' && \$call_in_exp
        abort("\nERROR: In a expression, procedure '#{\$procedure}' cannot return 'void'\n")
      end
      if \$return_type != 'void' && \$call_in_exp == false
        abort("\nERROR: The return value of '#{\$procedure}' must be assigned to something\n")
      end
      # Now, call the function
      # Gosub
      \$action = Hash[ id: 'Gosub', value: CODES::Codes[:GOSUB] ]
      \$direction = Hash[ value: $vars_block::auxiliar.procedures[\$procedure][:line] ]
      \$empty = Hash[ value: -1 ]
      \$proc_value = Hash[ value: \$procedure ]
      \$cuadruple = Cuadruples.new(\$action, \$proc_value, \$empty, \$direction)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      # If the returning type is different of void, then transfer to a
      # temporary variable
      if \$return_type != 'void'
        \$action = Hash[ id: '=', value: CODES::Codes[:ASSIGN] ]
        \$address = $vars_block::auxiliar.local_memory.getAddress(\$return_type, 'temporal')
        \$destiny = Hash[ type: \$return_type, value: \$address ]
        \$name = \$procedure + '_ret_swap'
        \$origin = $vars_block::auxiliar.global[\$name]
        \$cuadruple = Cuadruples.new(\$action, \$origin, \$empty, \$destiny)
        $vars_block::auxiliar.lines_counter += 1
        $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
        $vars_block::auxiliar.operands_stack.push(\$destiny)
      end
    }
    ;

llamadaargs: /* empty */
    | exp {
      # Gets the result of exp
      \$result = $vars_block::auxiliar.operands_stack.pop()
      # Gets the information about the argument
      \$procedure = $vars_block::auxiliar.call_stack.look()
      \$arg_number = $vars_block::auxiliar.arg_stack.pop()
      # Abort if the number of passed arguments is mayor than the number of
      # defined arguments in the procedure directory
      if \$arg_number >= $vars_block::auxiliar.procedures[\$procedure][:args].size
        \$msg = "\nERROR: Passing more arguments for '#{\$procedure}'\n" +
          $vars_block::auxiliar.getSignature(\$procedure)
        abort(\$msg)
      end
      \$argument = $vars_block::auxiliar.procedures[\$procedure][:args][\$arg_number]
      # Abort if the data types are different
      if \$argument[:type] != \$result[:type]
        abort("\nERROR: Different data types for the arguments of '#{\$procedure}'\n")
      end
      # Abort if the reference is applied to an expression
      if \$argument[:ref] && $vars_block::auxiliar.local_memory.temporal.checkAddress(\$result[:value])
        abort("\nERROR: Cannot apply 'ref' to an expression\n")
      end
      # Abort if the argument is an array and the passed value is not an array
      if \$argument[:array] && (\$result[:array].nil? || ! \$result[:array])
        abort("\nERROR: The argument '#{\$argument[:id]}' of '#{\$procedure}' must be an array\n")
      end
      # Abort if the argument is not an array and the passed value is an array
      if (! \$argument[:array]) && (! \$result[:array].nil?) && \$result[:array]
        abort("\nERROR: The argument '#{\$argument[:id]}' of '#{\$procedure}' is not an array\n")
      end
      # Abort if the argument and the passed values are arrays of different sizes
      if \$argument[:array] && (! \$result[:array].nil?) && \$result[:array] && (\$argument[:size] != \$result[:size])
        abort("\nERROR: The passed array in '#{\$procedure}' has different size than the argument '#{\$argument[:id]}'\n")
      end
      \$flag_ref = Hash[ value: 0 ]
      if \$argument[:ref]
        \$flag_ref[:value] = 1
      end
      if \$argument[:array]
        \$flag_ref[:value] = 2
      end
      # Param
      \$action = Hash[ id: 'Param', value: CODES::Codes[:PARAM] ]
      \$destiny = Hash[ value: \$arg_number ]
      \$cuadruple = Cuadruples.new(\$action, \$result, \$flag_ref, \$destiny)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      # Increments the argument counter
      \$arg_number += 1
      # And adds it to the stack of arguments
      $vars_block::auxiliar.arg_stack.push(\$arg_number)
    } llamadaargsaux
    ;

llamadaargsaux: /* empty */
    | COMMA exp {
      # Gets the result of exp
      \$result = $vars_block::auxiliar.operands_stack.pop()
      # Gets the information about the argument
      \$procedure = $vars_block::auxiliar.call_stack.look()
      \$arg_number = $vars_block::auxiliar.arg_stack.pop()
      # Abort if the number of passed arguments is mayor than the number of
      # defined arguments in the procedure directory
      if \$arg_number >= $vars_block::auxiliar.procedures[\$procedure][:args].size
        \$msg = "\nERROR: Passing more arguments for '#{\$procedure}'\n" +
          $vars_block::auxiliar.getSignature(\$procedure)
        abort(\$msg)
      end
      \$argument = $vars_block::auxiliar.procedures[\$procedure][:args][\$arg_number]
      # Abort if the data types are different
      if \$argument[:type] != \$result[:type]
        abort("\nERROR: Different data types for the arguments of '#{\$procedure}'\n")
      end
      if \$argument[:ref] && $vars_block::auxiliar.local_memory.temporal.checkAddress(\$result[:value])
        abort("\nERROR: Cannot apply 'ref' to an expression\n")
      end
      # Abort if the argument is an array and the passed value is not an array
      if \$argument[:array] && (\$result[:array].nil? || ! \$result[:array])
        abort("\nERRO: The argument '#{\$argument[:id]}' of '#{\$procedure}' must be and array\n")
      end
      # Abort if the argument is not an array and the passed value is an array
      if (! \$argument[:array]) && (! \$result[:array].nil?) && \$result[:array]
        abort("\nERROR: The argument '#{\$argument[:id]}' of '#{\$procedure}' is not an array\n")
      end
      # Abort if the argument and the passed values are arrays of different sizes
      if \$argument[:array] && (! \$result[:array].nil?) && \$result[:array] && (\$argument[:size] != \$result[:size])
        abort("\nERROR: The passed array in '#{\$procedure}' has different size than the argument '#{\$argument[:id]}'\n")
      end
      \$flag_ref = Hash[ value: 0 ]
      if \$argument[:ref]
        \$flag_ref[:value] = 1
      end
      if \$argument[:array]
        \$flag_ref[:value] = 2
      end
      # Param
      \$action = Hash[ id: 'Param', value: CODES::Codes[:PARAM] ]
      \$destiny = Hash[ value: \$arg_number ]
      \$cuadruple = Cuadruples.new(\$action, \$result, \$flag_ref, \$destiny)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      # Increments the argument counter
      \$arg_number += 1
      # And adds it to the stack of arguments
      $vars_block::auxiliar.arg_stack.push(\$arg_number)
    } llamadaargsaux
    ;

array:
    LSBRACK {
      # Push a false bottom in the operations stack
      $vars_block::auxiliar.operations_stack.push(' | ')
    } exp {
      # Extracts the resulting value of the expression
      \$oper1 = $vars_block::auxiliar.operands_stack.pop()
      \$id = $vars_block::auxiliar.operands_stack.pop()
      # Check if the id is an array
      \$var = $vars_block::auxiliar.findVariable(\$id)
      if (! \$var[:array])
        abort("\nERROR: The identifier '#{\$id}' is not an array\n")
      end
      # Check if the value is not an integer
      if \$oper1[:type] != 'int'
        abort("\nERROR: The index for '#{\$id}' must be an integer\n")
      end
      # Ver
      \$action = Hash[ id: 'Ver', value: CODES.tokenValue('Ver') ]
      \$lim_inf = Hash[ value: 0 ]
      \$lim_sup = Hash[ value: \$var[:size] ]
      \$cuadruple = Cuadruples.new(\$action, \$oper1, \$lim_inf, \$lim_sup)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      # Offset
      \$action = Hash[ id: 'Offset', value: CODES.tokenValue('Offset') ]
      \$pointer = Hash[ type: \$var[:type], value: $vars_block::auxiliar.pointer_memory.getAddress(\$var[:type]) ]
      \$base = Hash[ value: \$var[:value] ]
      \$cuadruple = Cuadruples.new(\$action, \$oper1, \$base, \$pointer)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      # Inserts the pointer for later use
      $vars_block::auxiliar.operands_stack.push(\$pointer)
    } RSBRACK {
      # Extracts the false bottom in the operations stack
      $vars_block::auxiliar.operations_stack.pop()
    }
    ;

expresion:
    exp expcomp {
      \$next_operation = $vars_block::auxiliar.operations_stack.look()
      if (! \$next_operation.nil?) && (\$next_operation == 'or' || \$next_operation == 'and')
        $vars_block::auxiliar.operations_stack.pop()
        \$oper2 = $vars_block::auxiliar.operands_stack.pop()
        \$oper1 = $vars_block::auxiliar.operands_stack.pop()
        \$resulting_type = $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper1, \$oper2)
        \$address = $vars_block::auxiliar.local_memory.getAddress(\$resulting_type, 'temporal')
        \$destiny = Hash[ type: \$resulting_type, value: \$address ]
        \$operation_value = Hash[ id: \$next_operation, value: CODES.tokenValue(\$next_operation) ]
        \$cuadruple = Cuadruples.new(\$operation_value, \$oper1, \$oper2, \$destiny)
        $vars_block::auxiliar.lines_counter += 1
        $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
        $vars_block::auxiliar.operands_stack.push(\$destiny)
      end
    } expresionaux
    ;

expresionaux: /* empty */
    | logico expresion
    ;

expcomp: /* empty */
  | comparacion exp {
    \$next_operation = $vars_block::auxiliar.operations_stack.look()
    if (! \$next_operation.nil?) && ['<', '<=', '>', '>=', '==', '!='].include?(\$next_operation)
      $vars_block::auxiliar.operations_stack.pop()
      \$oper2 = $vars_block::auxiliar.operands_stack.pop()
      \$oper1 = $vars_block::auxiliar.operands_stack.pop()
      \$resulting_type = $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper1, \$oper2)
      \$address = $vars_block::auxiliar.local_memory.getAddress(\$resulting_type, 'temporal')
      \$destiny = Hash[ type: \$resulting_type, value: \$address ]
      \$operation_value = Hash[ id: \$next_operation, value: CODES.tokenValue(\$next_operation) ]
      \$cuadruple = Cuadruples.new(\$operation_value, \$oper1, \$oper2, \$destiny)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      $vars_block::auxiliar.operands_stack.push(\$destiny)
    end
  }
  ;

exp:
    termino {
      \$next_operation = $vars_block::auxiliar.operations_stack.look()
      if (! \$next_operation.nil?) && (\$next_operation == '+' || \$next_operation == '-')
        $vars_block::auxiliar.operations_stack.pop()
        \$oper2 = $vars_block::auxiliar.operands_stack.pop()
        \$oper1 = $vars_block::auxiliar.operands_stack.pop()
        \$resulting_type = $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper1, \$oper2)
        \$address = $vars_block::auxiliar.local_memory.getAddress(\$resulting_type, 'temporal')
        \$destiny = Hash[ type: \$resulting_type, value: \$address ]
        \$operation_value = Hash[ id: \$next_operation, value: CODES.tokenValue(\$next_operation) ]
        \$cuadruple = Cuadruples.new(\$operation_value, \$oper1, \$oper2, \$destiny)
        $vars_block::auxiliar.lines_counter += 1
        $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
        $vars_block::auxiliar.operands_stack.push(\$destiny)
      end
    }
    expaux
    ;

expaux: /* empty */
    | PLUS {
      $vars_block::auxiliar.operations_stack.push( $PLUS.text )
    }
    exp
    | MINUS {
      $vars_block::auxiliar.operations_stack.push( $MINUS.text )
    }
    exp
    ;

termino:
    factor {
      \$next_operation = $vars_block::auxiliar.operations_stack.look()
      if (! \$next_operation.nil?) && (\$next_operation == '*' || \$next_operation == '/')
        $vars_block::auxiliar.operations_stack.pop()
        \$oper2 = $vars_block::auxiliar.operands_stack.look()
        $vars_block::auxiliar.operands_stack.pop()
        \$oper1 = $vars_block::auxiliar.operands_stack.look()
        $vars_block::auxiliar.operands_stack.pop()
        \$resulting_type = $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper1, \$oper2)
        \$address = $vars_block::auxiliar.local_memory.getAddress(\$resulting_type, 'temporal')
        \$destiny = Hash[ type: \$resulting_type, value: \$address ]
        \$operation_value = Hash[ id: \$next_operation, value: CODES.tokenValue(\$next_operation) ]
        \$cuadruple = Cuadruples.new(\$operation_value, \$oper1, \$oper2, \$destiny)
        $vars_block::auxiliar.lines_counter += 1
        $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
        $vars_block::auxiliar.operands_stack.push( \$destiny )
      end
    }
    terminoaux
    ;

terminoaux: /* empty */
    | TIMES {
      $vars_block::auxiliar.operations_stack.push( $TIMES.text )
    }
    termino
    | DIVIDE {
      $vars_block::auxiliar.operations_stack.push( $DIVIDE.text )
    }
    termino
    ;

factor:
    NOT {
      $vars_block::auxiliar.operations_stack.push( $NOT.text )
    } notfactor {
      # Gets the last element added to the operands_stack
      \$last_operand = $vars_block::auxiliar.operands_stack.pop()
      \$next_operation = $vars_block::auxiliar.operations_stack.pop()
      \$resulting_type = $vars_block::auxiliar.checkCuadruple(\$next_operation, \$last_operand)
      \$address = $vars_block::auxiliar.local_memory.getAddress(\$resulting_type, 'temporal')
      \$destiny = Hash[ type: \$resulting_type, value: \$address ]
      \$operation_value = Hash[ id: \$next_operation, value: CODES.tokenValue(\$next_operation) ]
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$operation_value, \$last_operand, \$empty, \$destiny)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      $vars_block::auxiliar.operands_stack.push(\$destiny)
    }
    | LPARENT {
      $vars_block::auxiliar.operations_stack.push( $LPARENT.text )
    } expresion RPARENT {
      $vars_block::auxiliar.operations_stack.pop()
    }
    | varcte
    ;

notfactor:
    LPARENT {
      $vars_block::auxiliar.operations_stack.push( $LPARENT.text )
    } expresion RPARENT {
      $vars_block::auxiliar.operations_stack.pop()
    }
    | varcte
    ;

sign:
    PLUS {
      $vars_block::auxiliar.sign_variable = $PLUS.text
    }
    | MINUS {
      $vars_block::auxiliar.sign_variable = $MINUS.text
    }
    ;

varcte:
    ID {
      $vars_block::auxiliar.operands_stack.push($ID.text)
    } idvarcte
    | CTEI {
      \$var = $CTEI.text.to_i
      \$const_info = Hash[ id: \$var, type: 'int', value: $vars_block::auxiliar.const_memory.getAddress(\$var, 'int') ]
      $vars_block::auxiliar.operands_stack.push( \$const_info )
    }
    | CTEF {
      \$var = $CTEF.text.to_f
      \$const_info = Hash[ id: \$var, type: 'float', value: $vars_block::auxiliar.const_memory.getAddress(\$var, 'float') ]
      $vars_block::auxiliar.operands_stack.push( \$const_info )
    }
    | CTES {
      \$var = $CTES.text
      \$var.gsub!('"', '')
      \$const_info = Hash[ id: \$var, type: 'string', value: $vars_block::auxiliar.const_memory.getAddress(\$var, 'string') ]
      $vars_block::auxiliar.operands_stack.push( \$const_info )
    }
    | CTEB {
      if not $vars_block::auxiliar.sign_variable.nil?
        abort("\nERROR: You cannot apply '+' or '-' to boolean\n")
      end
      \$var = $CTEB.text == 'true'
      \$const_info = Hash[ id: \$var, type: 'boolean', value: $vars_block::auxiliar.const_memory.getAddress(\$var, 'boolean') ]
      $vars_block::auxiliar.operands_stack.push( \$const_info )
    }
    ;

idvarcte:
    /* empty */ {
      \$id = $vars_block::auxiliar.operands_stack.pop()
      \$var = $vars_block::auxiliar.findVariable(\$id)
      $vars_block::auxiliar.operands_stack.push(\$var)
    }
    | {
      $vars_block::auxiliar.exp_call = true
    } llamada
    | array
    ;

comparacion:
    LT {
      $vars_block::auxiliar.operations_stack.push( $LT.text )
    }
    | LE {
      $vars_block::auxiliar.operations_stack.push( $LE.text )
    }
    | GT {
      $vars_block::auxiliar.operations_stack.push( $GT.text )
    }
    | GE {
      $vars_block::auxiliar.operations_stack.push( $GE.text )
    }
    | EQ {
      $vars_block::auxiliar.operations_stack.push( $EQ.text )
    }
    | NE {
      $vars_block::auxiliar.operations_stack.push( $NE.text )
    }
    ;

logico:
    AND {
      $vars_block::auxiliar.operations_stack.push( $AND.text )
    }
    | OR {
      $vars_block::auxiliar.operations_stack.push( $OR.text )
    }
    ;

retorno:
    RETURN retornoaux SEMICOLON {
      # Create the Goend cuadruple
      \$action = Hash[ id: 'Goend', value: CODES::Codes[:GOEND] ]
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$action, \$empty, \$empty, \$empty)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      # Indicates that this procedure has at least one return
      $vars_block::auxiliar.has_return = true
    }
    ;

retornoaux:
    /* empty */ {
      # Get the returning type of the actual procedure
      if $vars_block::auxiliar.scope_location.nil?
        abort("\nERROR: Cannot use 'return' outside of a procedure\n")
      end
      \$scope_location = $vars_block::auxiliar.scope_location
      \$return_type = $vars_block::auxiliar.procedures[\$scope_location][:return_type]
      if \$return_type != 'void'
        abort("\nERROR: The procedure '#{\$scope_location}' cannot return void\n")
      end
    }
    | exp {
      # Get the returning type of the actual procedure
      if $vars_block::auxiliar.scope_location.nil?
        abort("\nERROR: Cannot use 'return' outside of a procedure\n")
      end
      \$scope_location = $vars_block::auxiliar.scope_location
      \$return_type = $vars_block::auxiliar.procedures[\$scope_location][:return_type]
      # Gets the actual returning value
      \$returning = $vars_block::auxiliar.operands_stack.pop()
      if \$return_type == 'void'
        abort("\nERROR: The procedure '#{\$scope_location}' only can return void\n")
      elsif \$return_type != \$returning[:type]
        abort("\nERROR: The procedure '#{\$scope_location}' must return '#{\$return_type}'." \
          "\n\tActual returning type: '#{\$returning[:id]}' aka '#{\$returning[:type]}'\n")
      end
      # Generates the cuadruple
      \$name = \$scope_location + '_ret_swap'
      \$action = Hash[ id: 'Ret', value: CODES::Codes[:RET] ]
      \$empty = Hash[ value: -1 ]
      \$destiny = $vars_block::auxiliar.global[\$name]
      \$cuadruple = Cuadruples.new(\$action, \$returning, \$empty, \$destiny)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
    }
    ;

condicion:
    IF LPARENT expresion RPARENT {
      # Generate
      # GotoF, condition,nil,__
      # Push count-1 to jumps stack
      \$goto_false = Hash[ id: 'GotoF', value: CODES::Codes[:GOTOF] ]
      \$condition = $vars_block::auxiliar.operands_stack.pop()
      \$count = $vars_block::auxiliar.lines_counter
      $vars_block::auxiliar.jumps_stack.push(\$count)
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$goto_false, \$condition, \$empty, \$empty)
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      $vars_block::auxiliar.lines_counter += 1
    } LBRACK est RBRACK elsecondicion {
      \$jump = $vars_block::auxiliar.jumps_stack.pop()
      \$count = $vars_block::auxiliar.lines_counter
      $vars_block::auxiliar.cuadruples_array[\$jump].destiny = Hash[ value: \$count ]
    }
    ;

elsecondicion: /* empty */
    | ELSE {
      # False  = pop(jumps_stack)
      # Generate
      #   Goto, nil, nil, __
      #   Push count-1 to jumps stack
      #   Fill(false, count)
      \$goto_line = Hash[ id: 'Goto', value: CODES::Codes[:GOTO] ]
      \$jump = $vars_block::auxiliar.jumps_stack.pop()
      \$count = $vars_block::auxiliar.lines_counter
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$goto_line, \$empty, \$empty, \$empty)
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.jumps_stack.push(\$count)
      $vars_block::auxiliar.cuadruples_array[\$jump].destiny = Hash[ value: $vars_block::auxiliar.lines_counter ]
    } LBRACK est RBRACK
    ;

escritura:
    PRINT LPARENT argsescritura RPARENT SEMICOLON
    ;

argsescritura:
    exp {
      \$action = Hash[ id: 'Print', value: CODES::Codes[:PRINT] ]
      \$var = $vars_block::auxiliar.operands_stack.pop()
      \$type = Hash[ value: \$var[:type] ]
      # Format:
      # Action, Data type, , Address
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$action, \$type, \$empty, \$var)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
    } argsescrituraaux
    ;

argsescrituraaux: /* empty */
    | COMMA argsescritura
    ;

ciclo:
    FOR LPARENT cicloaux SEMICOLON {
      # Insert the next line cuadruple in jumps_stack
      $vars_block::auxiliar.jumps_stack.push( $vars_block::auxiliar.lines_counter)
    } expresion SEMICOLON {
      \$condition = $vars_block::auxiliar.operands_stack.pop()
      # Insert the next line cuadruple in jumps_stack
      $vars_block::auxiliar.jumps_stack.push( $vars_block::auxiliar.lines_counter)
      # Create the GotoF cuadruple
      \$goto_line = Hash[ id: 'GotoF', value: CODES::Codes[:GOTOF] ]
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$goto_line, \$condition, \$empty, \$empty)
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      $vars_block::auxiliar.lines_counter += 1
      # Insert the next line cuadruple in jumps_stack
      $vars_block::auxiliar.jumps_stack.push( $vars_block::auxiliar.lines_counter)
      # Create the Goto cuadruple
      \$goto_line = Hash[ id: 'Goto', value: CODES::Codes[:GOTO] ]
      \$cuadruple = Cuadruples.new(\$goto_line, \$empty, \$empty, \$empty)
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      $vars_block::auxiliar.lines_counter += 1
      # Insert the next line cuadruple in jumps_stack
      $vars_block::auxiliar.jumps_stack.push( $vars_block::auxiliar.lines_counter )
    } cicloaux RPARENT {
      \$aux_jumps = Stack.new
      3.times {
        \$aux_jumps.push( $vars_block::auxiliar.jumps_stack.pop() )
      }
      # Start of the for condition
      \$for_cond_ini = Hash[ value: $vars_block::auxiliar.jumps_stack.pop() ]
      # Create a Goto cuadruple
      \$goto_line = Hash[ id: 'Goto', value: CODES::Codes[:GOTO] ]
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$goto_line, \$empty, \$empty, \$for_cond_ini)
      $vars_block::auxiliar.cuadruples_array.push( \$cuadruple )
      $vars_block::auxiliar.lines_counter += 1
      # Transfer one line from aux_jumps to jumps_stack
      $vars_block::auxiliar.jumps_stack.push( \$aux_jumps.pop() )
      # Get the line of the Goto cuadruple in the for
      \$for_cond_true = \$aux_jumps.pop()
      # Fill that cuadruple with the next cuadruple line
      $vars_block::auxiliar.cuadruples_array[\$for_cond_true].destiny = Hash[ value: $vars_block::auxiliar.lines_counter ]
      # Transfer another line from aux_jumps to jumps_stack
      # Transfer one line from aux_jumps to jumps_stack
      $vars_block::auxiliar.jumps_stack.push( \$aux_jumps.pop() )
    } LBRACK est RBRACK {
      # Get the line of the for increment cuadruple
      \$for_increment = Hash[ value: $vars_block::auxiliar.jumps_stack.pop() ]
      # Create a Goto cuadruple with that destination
      \$goto_line = Hash[ id: 'Goto', value: CODES::Codes[:GOTO] ]
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$goto_line, \$empty, \$empty, \$for_increment)
      $vars_block::auxiliar.cuadruples_array.push( \$cuadruple )
      $vars_block::auxiliar.lines_counter += 1
      # Get the line of the GotoF cuadruple in the for
      \$for_cond_false = $vars_block::auxiliar.jumps_stack.pop()
      # Fill that cuadruple
      $vars_block::auxiliar.cuadruples_array[\$for_cond_false].destiny = Hash[ value: $vars_block::auxiliar.lines_counter ]
    }
    ;

cicloaux: /* empty */
    | ID {
      \$id = $ID.text
      $vars_block::auxiliar.operands_stack.push(\$id)
    } cicloauxx ASSIGN {
      $vars_block::auxiliar.operations_stack.push( $ASSIGN.text )
    } exp {
      \$next_operation = $vars_block::auxiliar.operations_stack.pop()
      \$oper1 = $vars_block::auxiliar.operands_stack.pop()
      \$oper2 = $vars_block::auxiliar.operands_stack.pop()
      $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper2, \$oper1)
      \$operation_value = Hash[ id: \$next_operation, value: CODES.tokenValue(\$next_operation) ]
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$operation_value, \$oper1, \$empty, \$oper2)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
    }
    ;

cicloauxx: 
    /* empty */ {
      \$id = $vars_block::auxiliar.operands_stack.pop()
      \$var = $vars_block::auxiliar.findVariable(\$id)
      $vars_block::auxiliar.operands_stack.push(\$var)
    }
    | array
    ;

lectura:
    INPUT LPARENT tipo COMMA ID RPARENT {
      \$action = Hash[ id: 'Input', value: CODES::Codes[:INPUT] ]
      \$type = Hash[ value: $vars_block::auxiliar.data_type ]
      \$id = $ID.text
      \$var = $vars_block::auxiliar.findVariable(\$id)
      \$empty = Hash[ value: -1 ]
      \$cuadruple = Cuadruples.new(\$action, \$type, \$empty, \$var)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
    } SEMICOLON
    ;

main:
    MAIN {
      # Resolves the first cuadruple, Goto main
      \$main_cuadruple = $vars_block::auxiliar.jumps_stack.pop()
      $vars_block::auxiliar.cuadruples_array[\$main_cuadruple].destiny = Hash[ value: $vars_block::auxiliar.lines_counter ]
      $vars_block::auxiliar.scope_location = $MAIN.text
      if (! $vars_block::auxiliar.procedures.has_key?($vars_block::auxiliar.scope_location))
        $vars_block::auxiliar.arguments.clear()
        $vars_block::auxiliar.data_type = 'void'
        $vars_block::auxiliar.addProcedure()
        $vars_block::auxiliar.has_return = false
        $vars_block::auxiliar.local_memory.resetCounters()
      else
        abort("\nERROR: The program can only have one main procedure\n")
      end
    } LPARENT RPARENT LBRACK var est RBRACK {
      \$scope_location = $vars_block::auxiliar.scope_location
      # Insert the corresponding memory space in the procedure directory
      \$normal = $vars_block::auxiliar.local_memory.normal.to_hash
      \$temporal = $vars_block::auxiliar.local_memory.temporal.to_hash
      \$pointers = $vars_block::auxiliar.pointer_memory.to_hash
      \$memory = Hash[ normal: \$normal, temporal: \$temporal, pointers: \$pointers ]
      $vars_block::auxiliar.procedures[\$scope_location][:memory] = \$memory
    }
    ;
