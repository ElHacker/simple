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
  output    = AST;
  backtrack = true;
}

@header {
  require 'Auxiliar.rb'
  require 'Queue.rb'
  require 'Stack.rb'
  require 'Cuadruples.rb'
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
  # First cuadruple, go to the main procedure
  \$goto_line = 'Goto'
  $vars_block::auxiliar.jumps_stack.push( $vars_block::auxiliar.lines_counter )
  \$cuadruple = Cuadruples.new(\$goto_line, nil, nil, nil)
  $vars_block::auxiliar.lines_counter += 1
  $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
}

/* Callback executed at the end of programa */
@after {
  puts("\n\nFound this global variables: \n")
  \$global = $vars_block::auxiliar.global
  \$global.keys.sort.each do | key |
    \$var_info = \$global[key]
    print("#{key} : type=#{\$var_info[:type]}, value=#{\$var_info[:value]}\n")
  end

  puts("\n\nFound this functions: \n")
  \$functions = $vars_block::auxiliar.procedures
  \$functions.keys.sort.each do | key |
    \$proc_info = \$functions[key]
    print("#{key}: #{\$proc_info}\n")
  end

  puts("\n\nCuadruples:\n")
  \$cuadruples = $vars_block::auxiliar.cuadruples_array
  \$cuadruples.each_with_index do | cuadruple, index |
    puts( "#{index} : #{cuadruple.to_s}")
  end
}
  : programa 
  ;


programa:
    var func main { print("[PROGRAMA] -> Entrada aceptada\n") }
    ;

var:
    | variables var
    ;

variables:
    INT ID as_int=assignint SEMICOLON {
      \$var_info = { id: $ID.text, type: $INT.text, value: \$as_int }
      $vars_block::auxiliar.addVariable(\$var_info)
    }
    | FLOAT ID as_float=assignfloat SEMICOLON { 
      \$var_info = { id: $ID.text, type: $FLOAT.text, value: \$as_float } 
      $vars_block::auxiliar.addVariable(\$var_info)
    }
    | STRING ID as_string=assignstring SEMICOLON { 
      \$var_info = { id: $ID.text, type: $STRING.text, value: \$as_string }
      $vars_block::auxiliar.addVariable(\$var_info)
    }
    | BOOLEAN ID as_boolean=assignboolean SEMICOLON { 
      \$var_info = { id: $ID.text, type: $BOOLEAN.text, value: \$as_boolean }
      $vars_block::auxiliar.addVariable(\$var_info)
    }
    | ARRAY tipo ID COLON exp SEMICOLON { 
      \$data_type = $vars_block::auxiliar.data_type
      \$var_info = { id: $ID.text, type: "[#{\$data_type}]" }
      $vars_block::auxiliar.addVariable(\$var_info)
    } /* TODO: missing size of array */
    ;

assignint returns[value]:
    | /* empty */
    | ASSIGN CTEI { $value = $CTEI.text.to_i }
    ;

assignfloat returns[value]:
    | /* empty */
    | ASSIGN CTEF { $value = $CTEF.text.to_f}
    ;

assignstring returns[value]:
    |  /* empty */
    | ASSIGN CTES { $value = $CTES.text }
    ;

assignboolean returns[value]:
    | /* empty */
    | ASSIGN CTEB { $value = $CTEB.text == 'true' } /* Convert string to boolean */
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
    } LPARENT argumentos RPARENT COLON retornofunc {
      $vars_block::auxiliar.addProcedure()
    } LBRACK var est RBRACK {
      $vars_block::auxiliar.arguments.clear()
      # Checks if the procudure has a correct return
      \$scope_location = $vars_block::auxiliar.scope_location
      \$returning_type = $vars_block::auxiliar.procedures[\$scope_location][:return_type]
      if \$returning_type != 'void' && $vars_block::auxiliar.has_return == false
        abort("\nERROR: The procedure '#{\$scope_location}' must have a return statement\n")
      end
    }
    ;

argumentos: /* empty */
    | tipo ref ID {
      \$type = $vars_block::auxiliar.data_type
      \$ref = $vars_block::auxiliar.is_ref
      $vars_block::auxiliar.checkParamInArguments( $ID.text )
      $vars_block::auxiliar.arguments.push( { type: \$type, ref: \$ref, id: $ID.text } )
    } argumentoaux
    ;

argumentoaux: /* empty */
    | COMMA tipo ref ID {
      \$type = $vars_block::auxiliar.data_type
      \$ref = $vars_block::auxiliar.is_ref
      $vars_block::auxiliar.checkParamInArguments( $ID.text )
      $vars_block::auxiliar.arguments.push( { type: \$type, ref: \$ref, id: $ID.text } )
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
    } idestatutos SEMICOLON {
      $vars_block::auxiliar.exp_call = false
    }
    | condicion
    | escritura { print("[ESTATUTOS] ") }
    | ciclo
    | lectura { print("[ESTATUTOS] ") }
    | retorno { print("[ESTATUTOS] ") }
    ;

idestatutos:
    llamada
    | array ASSIGN expresion { print("[IDESTATUTOS] ") }
    | ASSIGN {
      \$id = $vars_block::auxiliar.operands_stack.pop()
      \$var = $vars_block::auxiliar.findVariable(\$id)
      $vars_block::auxiliar.operands_stack.push(\$var)
      $vars_block::auxiliar.operations_stack.push( $ASSIGN.text )
    } expresion {
      \$next_operation = $vars_block::auxiliar.operations_stack.pop()
      \$oper1 = $vars_block::auxiliar.operands_stack.pop()
      \$oper2 = $vars_block::auxiliar.operands_stack.pop()
      $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper2, \$oper1)
      \$cuadruple = Cuadruples.new(\$next_operation, \$oper1, nil, \$oper2)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
    }
    ;

llamada:
    LPARENT {
      \$procedure = $vars_block::auxiliar.operands_stack.look()
      if not $vars_block::auxiliar.procedures.has_key?(\$procedure)
        abort("\nERROR: Procedure '#{\$procedure}' not defined\n")
      end
      $vars_block::auxiliar.arg_stack.push(0)
      $vars_block::auxiliar.call_stack.push(\$procedure)
      \$action = 'Era'
      \$cuadruple = Cuadruples.new(\$action, \$procedure, nil, nil)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
    } llamadaargs RPARENT {
      # TODO terminar la comprobacion de la funcion y el tipo de retorno
      \$procedure = $vars_block::auxiliar.operands_stack.pop()
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
      \$action = 'Gosub'
      \$direction = $vars_block::auxiliar.procedures[\$procedure][:line]
      \$cuadruple = Cuadruples.new(\$action, \$procedure, nil, \$direction)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      # If the returning type is different of void, then transfer to a
      # temporary variable
      if \$return_type != 'void'
        \$action = '='
        # In the future, get a new temporal variable
        \$temp = 't' + $vars_block::auxiliar.next_temp.to_s
        $vars_block::auxiliar.next_temp += 1
        \$destiny = { id: \$temp, type: \$return_type, value: nil }
        \$name = \$procedure + '_ret_swap'
        \$origin = $vars_block::auxiliar.global[\$name]
        \$cuadruple = Cuadruples.new(\$action, \$origin, nil, \$destiny)
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
      \$argument = $vars_block::auxiliar.procedures[\$procedure][:args][\$arg_number]
      # Abort if the number of passed arguments is mayor than the number of
      # defined arguments in the procedure directory
      if \$argument.nil?
        msg = "\nERROR: Passing more arguments for '#{\$procedure}'\n" +
          $vars_block::auxiliar.getSignature(\$procedure)
        abort(msg)
      end
      # TODO
      # Change this to see if the address of the variables is a temporal
      # \$result[:value] => address of temporal variable
      if \$argument[:is_ref] && \$result[:id][0] == 't'
        abort("\nERROR: Cannot apply 'ref' to an expression\n")
      end
      \$flag_ref = 0
      if \$argument[:is_ref]
        \$flag_ref = 1
      end
      \$action = 'Param'
      \$cuadruple = Cuadruples.new(\$action, \$flag_ref, nil, \$result)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      # Increments the argument counter
      \$arg_number += 1
      # And adds it to the stack of arguments
      $vars_block::auxiliar.arg_stack.push(\$arg_number)
    } llamadaargsaux
    ;

llamadaargsaux: /* emtpy */
    | COMMA exp {
      # Gets the result of exp
      \$result = $vars_block::auxiliar.operands_stack.pop()
      # Gets the information about the argument
      \$procedure = $vars_block::auxiliar.call_stack.look()
      \$arg_number = $vars_block::auxiliar.arg_stack.pop()
      \$argument = $vars_block::auxiliar.procedures[\$procedure][:args][\$arg_number]
      # Abort if the number of passed arguments is mayor than the number of
      # defined arguments in the procedure directory
      if \$argument.nil?
        abort("\nERROR: Passing more arguments for '#{\$procedure}'\n")
      end
      # TODO
      # Change this to see if the address of the variables is a temporal
      # \$result[:value] => address of temporal variable
      if \$argument[:is_ref] && \$result[:id][0] == 't'
        abort("\nERROR: Cannot apply 'ref' to an expression\n")
      end
      \$flag_ref = 0
      if \$argument[:is_ref]
        \$flag_ref = 1
      end
      \$action = 'Param'
      \$cuadruple = Cuadruples.new(\$action, \$flag_ref, nil, \$result)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      # Increments the argument counter
      \$arg_number += 1
      # And adds it to the stack of arguments
      $vars_block::auxiliar.arg_stack.push(\$arg_number)
    } llamadaargsaux
    ;

array:
    LSBRACK exp RSBRACK { print("[ARRAY] ") }
    ;

expresion:
    exp expcomp {
      \$next_operation = $vars_block::auxiliar.operations_stack.look()
      if (not \$next_operation.nil?) && (['or', 'and'].include?(\$next_operation))
        $vars_block::auxiliar.operations_stack.pop()
        \$oper2 = $vars_block::auxiliar.operands_stack.pop()
        \$oper1 = $vars_block::auxiliar.operands_stack.pop()
        \$resulting_type = $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper1, \$oper2)
        # In the future, use the nextTemporalVariable
        \$temp = 't' + $vars_block::auxiliar.next_temp.to_s
        $vars_block::auxiliar.next_temp += 1
        \$destiny = { id: \$temp, type: \$resulting_type, value: nil }
        \$cuadruple = Cuadruples.new(\$next_operation, \$oper1, \$oper2, \$destiny)
        $vars_block::auxiliar.lines_counter += 1
        $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
        $vars_block::auxiliar.operands_stack.push(\$destiny)
      end
    } expresionaux { print("[EXPRESION] ") }
    ;

expresionaux: /* empty */
    | logico expresion
    ;

expcomp: /* empty */
  | comparacion exp { 
    \$next_operation = $vars_block::auxiliar.operations_stack.look()
    if (not \$next_operation.nil?) && (['<', '<=', '>', '>=', '==', '!='].include?(\$next_operation))
      $vars_block::auxiliar.operations_stack.pop()
      \$oper2 = $vars_block::auxiliar.operands_stack.pop()
      \$oper1 = $vars_block::auxiliar.operands_stack.pop()
      \$resulting_type = $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper1, \$oper2)
      # In the future, use the nextTemporalVariable
      \$temp = 't' + $vars_block::auxiliar.next_temp.to_s
      $vars_block::auxiliar.next_temp += 1
      \$destiny = { id: \$temp, type: \$resulting_type, value: nil }
      \$cuadruple = Cuadruples.new(\$next_operation, \$oper1, \$oper2, \$destiny)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      $vars_block::auxiliar.operands_stack.push(\$destiny)
    end
  }
  ;

exp:
    termino {
      \$next_operation = $vars_block::auxiliar.operations_stack.look()
      if (not \$next_operation.nil?) && (\$next_operation == '+' || \$next_operation == '-')
        $vars_block::auxiliar.operations_stack.pop()
        \$oper2 = $vars_block::auxiliar.operands_stack.pop()
        \$oper1 = $vars_block::auxiliar.operands_stack.pop()
        \$resulting_type = $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper1, \$oper2)
        # In the future, use the nextTemporalVariable
        \$temp = 't' + $vars_block::auxiliar.next_temp.to_s
        $vars_block::auxiliar.next_temp += 1
        \$destiny = { id: \$temp, type: \$resulting_type, value: nil }
        \$cuadruple = Cuadruples.new(\$next_operation, \$oper1, \$oper2, \$destiny)
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
      if (not \$next_operation.nil?) && (\$next_operation == '*' || \$next_operation == '/')
        $vars_block::auxiliar.operations_stack.pop()
        \$oper2 = $vars_block::auxiliar.operands_stack.look()
        $vars_block::auxiliar.operands_stack.pop()
        \$oper1 = $vars_block::auxiliar.operands_stack.look()
        $vars_block::auxiliar.operands_stack.pop()
        \$resulting_type = $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper1, \$oper2)
        # Change this in the future with nextTemporalVariable
        \$temp = 't' + $vars_block::auxiliar.next_temp.to_s
        $vars_block::auxiliar.next_temp += 1
        \$destiny = { id: \$temp, type: \$resulting_type, value: nil }
        \$cuadruple = Cuadruples.new(\$next_operation, \$oper1, \$oper2, \$destiny)
        $vars_block::auxiliar.lines_counter += 1
        $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
        $vars_block::auxiliar.operands_stack.push( \$destiny )
      end
    }
    terminoaux
    ;

terminoaux: /* empty */
    | TIMES {
      # Change this with the value for *
      $vars_block::auxiliar.operations_stack.push( $TIMES.text )
    } 
    termino 
    | DIVIDE {
      # Change this with the value for /
      $vars_block::auxiliar.operations_stack.push( $DIVIDE.text )
    }
    termino 
    ;

/* TODO: Corregir la parte del NOT para parentesis y expresiones, y del signo */
factor:
    NOT {
      # Change this with the value for not
      $vars_block::auxiliar.operations_stack.push( $NOT.text )
    } notfactor {
      # Gets the last element added to the operands_stack
      \$last_operand = $vars_block::auxiliar.operands_stack.pop()
      \$next_operation = $vars_block::auxiliar.operations_stack.pop()
      \$resulting_type = $vars_block::auxiliar.checkCuadruple(\$next_operation, \$last_operand)
      # In the future, use the nextTemporalVariable
      \$temp = 't' + $vars_block::auxiliar.next_temp.to_s
      $vars_block::auxiliar.next_temp += 1
      \$destiny = { id: \$temp, type: \$resulting_type, value: nil }
      \$cuadruple = Cuadruples.new(\$next_operation, \$last_operand, nil, \$destiny)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      $vars_block::auxiliar.operands_stack.push(\$destiny)
    }
    | LPARENT {
      $vars_block::auxiliar.operations_stack.push( $LPARENT.text )
    } expresion RPARENT {
      $vars_block::auxiliar.operations_stack.pop()
    }
    /*| sign varcte */
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
    } idvarcte {
      #if not $vars_block::auxiliar.sign_variable.nil?
      #  if \$var[:type] == 'string'
      #    abort("\nERROR: Cannot apply #{$vars_block::auxiliar.sign_variable} to string #{\$var[:id]}\n")
      #  elsif \$var[:type] == 'boolean'
      #    abort("\nERROR: Cannot apply #{$vars_block::auxiliar.sign_variable} to boolean #{\$var[:id]}\n")
      #  elsif $vars_block::auxiliar.sign_variable == '-'
      #    \$var[:value] = - \$var[:value]
      #    $vars_block::auxiliar.sign_variable = nil
      #  end
      #end
    }
    | CTEI {
      \$var = { id: nil, type: 'int', value: $CTEI.text.to_i }
      $vars_block::auxiliar.operands_stack.push( \$var )
    }
    | CTEF {
      \$var = { id: nil, type: 'float', value: $CTEF.text.to_f }
      $vars_block::auxiliar.operands_stack.push( \$var )
    }
    | CTES { 
      if not $vars_block::auxiliar.sign_variable.nil?
        abort("\nERROR: You cannot apply '+' or '-' to the string #{$CTES.text}\n")
      end
      $vars_block::auxiliar.operands_stack.push({ id: nil, type: 'string', value: $CTES.text })
    }
    | CTEB { 
      if not $vars_block::auxiliar.sign_variable.nil?
        abort("\nERROR: You cannot apply '+' or '-' to boolean\n")
      end
      $vars_block::auxiliar.operands_stack.push({ id: nil, type: 'boolean', value: $CTEB.text == 'true' })
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
    | array { print("[IDVARCTE] ") }
    ;

comparacion:
    LT {
      # Change this with the value for <
      $vars_block::auxiliar.operations_stack.push( $LT.text )
    }
    | LE {
      # Change this with the value for <=
      $vars_block::auxiliar.operations_stack.push( $LE.text )
    }
    | GT {
      # Change this with the value for >
      $vars_block::auxiliar.operations_stack.push( $GT.text )
    }
    | GE {
      # Change this with the value for >=
      $vars_block::auxiliar.operations_stack.push( $GE.text )
    }
    | EQ {
      # Change this with the value for ==
      $vars_block::auxiliar.operations_stack.push( $EQ.text )
    }
    | NE {
      # Change this with the value for !=
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
      # Create the End cuadruple
      \$action = 'End'
      \$cuadruple = Cuadruples.new(\$action, nil, nil, nil)
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
      \$action = 'Ret'
      \$cuadruple = Cuadruples.new(\$action, \$returning, nil,  \$name)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
    }
    ;

condicion:
    IF LPARENT expresion RPARENT {
      # Generate
      # GotoF, condition,nil,__
      # Push count-1 to jumps stack
      \$goto_false = "GotoF"
      \$condition = $vars_block::auxiliar.operands_stack.pop()
      \$count = $vars_block::auxiliar.lines_counter
      $vars_block::auxiliar.jumps_stack.push(\$count)
      \$cuadruple = Cuadruples.new(\$goto_false, \$condition, nil, nil)
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      $vars_block::auxiliar.lines_counter += 1
    } LBRACK est RBRACK elsecondicion { 
      \$jump = $vars_block::auxiliar.jumps_stack.pop()
      \$count = $vars_block::auxiliar.lines_counter
      $vars_block::auxiliar.cuadruples_array[\$jump].destiny = \$count
    }
    ;

elsecondicion: /* empty */
    | ELSE {
      # False  = pop(jumps_stack)
      # Generate
      #   Goto, nil, nil, __
      #   Push count-1 to jumps stack
      #   Fill(false, count)
      \$goto_line = "Goto"
      \$jump = $vars_block::auxiliar.jumps_stack.pop()
      \$count = $vars_block::auxiliar.lines_counter
      \$cuadruple = Cuadruples.new(\$goto_line, nil, nil, nil)
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.jumps_stack.push(\$count)
      $vars_block::auxiliar.cuadruples_array[\$jump].destiny = $vars_block::auxiliar.lines_counter 
    } LBRACK est RBRACK
    ;

escritura:
    PRINT LPARENT argsescritura RPARENT SEMICOLON { print("[ESCRITURA] ") }
    ;

argsescritura:
    exp argsescrituraaux { print("[ARGSESCRITURA] ") }
    ;

argsescrituraaux: /* empty */
    | COMMA argsescritura { print("[ARGSESCRITURAAUX] ") }
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
      \$goto_line = "GotoF"
      \$cuadruple = Cuadruples.new(\$goto_line, \$condition, nil, nil)
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      $vars_block::auxiliar.lines_counter += 1
      # Insert the next line cuadruple in jumps_stack
      $vars_block::auxiliar.jumps_stack.push( $vars_block::auxiliar.lines_counter)
      # Create the Goto cuadruple
      \$goto_line = "Goto"
      \$cuadruple = Cuadruples.new(\$goto_line, nil, nil, nil)
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
      $vars_block::auxiliar.lines_counter += 1
      # Insert the next line cuadruple in jumps_stack
      $vars_block::auxiliar.jumps_stack.push( $vars_block::auxiliar.lines_counter)
    } cicloaux RPARENT {
      \$aux_jumps = Stack.new
      3.times {
        \$aux_jumps.push( $vars_block::auxiliar.jumps_stack.pop() )
      }
      # Start of the for condition
      \$for_cond_ini = $vars_block::auxiliar.jumps_stack.pop()
      # Create a Goto cuadruple
      \$goto_line = "Goto"
      \$cuadruple = Cuadruples.new(\$goto_line, nil, nil, \$for_cond_ini)
      $vars_block::auxiliar.cuadruples_array.push( \$cuadruple )
      $vars_block::auxiliar.lines_counter += 1
      # Transfer one line from aux_jumps to jumps_stack
      $vars_block::auxiliar.jumps_stack.push( \$aux_jumps.pop() )
      # Get the line of the Goto cuadruple in the for
      \$for_cond_true = \$aux_jumps.pop()
      # Fill that cuadruple with the next cuadruple line
      $vars_block::auxiliar.cuadruples_array[\$for_cond_true].destiny = $vars_block::auxiliar.lines_counter
      # Transfer another line from aux_jumps to jumps_stack
      # Transfer one line from aux_jumps to jumps_stack
      $vars_block::auxiliar.jumps_stack.push( \$aux_jumps.pop() )
    } LBRACK est RBRACK {
      # Get the line of the for increment cuadruple
      \$for_increment = $vars_block::auxiliar.jumps_stack.pop()
      # Create a Goto cuadruple with that destination
      \$goto_line = "Goto"
      \$cuadruple = Cuadruples.new(\$goto_line, nil, nil, \$for_increment)
      $vars_block::auxiliar.cuadruples_array.push( \$cuadruple )
      $vars_block::auxiliar.lines_counter += 1
      # Get the line of the GotoF cuadruple in the for
      \$for_cond_false = $vars_block::auxiliar.jumps_stack.pop()
      # Fill that cuadruple
      $vars_block::auxiliar.cuadruples_array[\$for_cond_false].destiny = $vars_block::auxiliar.lines_counter
    }
    ;

cicloaux: /* empty */
    | ID {
      \$id = $ID.text
      \$var = $vars_block::auxiliar.findVariable(\$id)
      $vars_block::auxiliar.operands_stack.push(\$var)
      # For now, we ignore the array
    } cicloauxx ASSIGN {
      # Change this with the value for =
      $vars_block::auxiliar.operations_stack.push( $ASSIGN.text )
    } exp {
      \$next_operation = $vars_block::auxiliar.operations_stack.look()
      $vars_block::auxiliar.operations_stack.pop()
      \$oper1 = $vars_block::auxiliar.operands_stack.look()
      $vars_block::auxiliar.operands_stack.pop()
      \$oper2 = $vars_block::auxiliar.operands_stack.look()
      $vars_block::auxiliar.operands_stack.pop()
      $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper2, \$oper1)
      \$cuadruple = Cuadruples.new(\$next_operation, \$oper1, nil, \$oper2)
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.cuadruples_array.push(\$cuadruple)
    }
    ;

cicloauxx: /* empty */
    | array { print("[CICLOAUXX] ") }
    ;

lectura:
    INPUT LPARENT tipo COMMA ID RPARENT SEMICOLON { print("[LECTURA] ") }
    ;

main:
    MAIN {
      # Resolves the first cuadruple, Goto main
      \$main_cuadruple = $vars_block::auxiliar.jumps_stack.pop()
      $vars_block::auxiliar.cuadruples_array[\$main_cuadruple].destiny = $vars_block::auxiliar.lines_counter
      $vars_block::auxiliar.scope_location = $MAIN.text 
      if not $vars_block::auxiliar.procedures.has_key?($vars_block::auxiliar.scope_location)
        $vars_block::auxiliar.arguments.clear()
        $vars_block::auxiliar.data_type = 'void'
        $vars_block::auxiliar.addProcedure()
      else
        abort("\nERROR: The program can only have one main procedure\n")
      end
    } LPARENT RPARENT LBRACK var est RBRACK
    ;
