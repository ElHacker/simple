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
  require 'Queue.rb'
  require 'Stack.rb'
  require 'Cuadruples.rb'
}

/* Scanner Rules */
INT: 'int' { print("<INT> ") };
FLOAT: 'float' { print("<FLOAT> ") };
BOOLEAN: 'boolean' { print("<BOOLEAN> ") };
STRING: 'string' { print("<STRING> ") };
ARRAY: 'array' { print("<ARRAY> ") };
MAIN: 'main' { print("<MAIN> ") };
VOID: 'void' { print("<VOID> ") };
FUNCTION: 'function' { print("<FUNCTION> ") };
RETURN: 'return' { print("<RETURN> ") };
FOR: 'for' { print("<FOR> ") };
IF: 'if' { print("<IF> ") };
ELSE: 'else' { print("<ELSE> ") };
PRINT: 'print' { print("<PRINT> ") };
INPUT: 'input' { print("<INPUT> ") };
ASSIGN: '=' { print("<ASSIGN> ") };
LT: '<' { print("<LT> ") };
LE: '<=' { print("<LE> ") };
GT: '>' { print("<GT> ") };
GE: '>=' { print("<GE> ") };
EQ: '==' { print("<EQ> ") };
NE: '!=' { print("<NE> ") };
NOT: 'not' { print("<NOT> ") };
AND: 'and' { print("<AND> ") };
OR: 'or' { print("<OR> ") };
LBRACK: '{' { print("<LBRACK> ") };
RBRACK: '}' { print("<RBRACK> ") };
LPARENT: '(' { print("<LPARENT> ") };
RPARENT: ')' { print("<RPARENT> ") };
LSBRACK: '[' { print("<LSBRACK> ") }; 
RSBRACK: ']' { print("<RSBRACK> ") };
COMMA: ',' { print("<COMMA> ") };
REF: '&' { print("<REF> ") };
SEMICOLON: ';' { print("<SEMICOLON> ") };
COLON: ':' { print("<COLON> ") };
PLUS: '+' { print("<PLUS> ") };
MINUS: '-' { print("<MINUS> ") };
TIMES: '*' { print("<TIMES> ") };
DIVIDE: '/' { print("<DIVIDE> ") };
CTEI: DIGITS { print("<CTEI> ") };
CTEF: DIGITS '.' DIGITS { print("<CTEF> ") };
CTES: '"' (NormalChar)* '"' { print("<CTES> ") };
CTEB: 'true' | 'false' { print("<CTEB> ") };
ID: Identifier { print("<ID> ") };
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
  global;
  procedures;
  operands_stack;
  operations_stack;
  jumps_stack;
  lines_counter;
  cuadruples_array;
  scope_location;
  sign_variable;
  next_temp;
  semanthic_cube;
}

@init {
  $vars_block::global = Hash.new;
  $vars_block::procedures = Hash.new;
  $vars_block::operands_stack = Stack.new;
  $vars_block::operations_stack = Stack.new;
  $vars_block::jumps_stack = Stack.new;
  $vars_block::lines_counter = 0;
  $vars_block::cuadruples_array = [];
  $vars_block::scope_location = nil;
  $vars_block::sign_variable = nil;
  $vars_block::next_temp = 1;
  $vars_block::semanthic_cube = {
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
      }
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
	'or' => 'boolean',
      }
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
      }
    }
  }
}

/* Callback executed at the end of programa */
@after {
  puts("\n\nFound this global variables: \n")
  $vars_block::global.keys.sort.each do | key |
    \$var_info = $vars_block::global[key]
    print("#{key} : type=#{\$var_info[:type]}, value=#{\$var_info[:value]}\n")
  end

  puts("\n\nFound this functions: \n")
  $vars_block::procedures.keys.sort.each do | key |
    \$proc_info = $vars_block::procedures[key]
    print("#{key} : #{\$proc_info}\n")
  end

  puts("\n\nCuadruples:\n")
  $vars_block::cuadruples_array.each do | cuadruple |
    print("op: #{cuadruple[:op]}, oper1: #{cuadruple[:op1]}, oper2: #{cuadruple[:op2]}, dest: #{cuadruple[:dest]}\n")
  end
}
  : programa
  ;


programa:
    var func main
    ;

var:
    | variables var
    ;

variables:
    INT ID as_int=assignint SEMICOLON {
      \$var_info = { id: $ID.text, type: $INT.text, value: $as_int.value }
      \$scope_location = $vars_block::scope_location
      if \$scope_location == nil
	if $vars_block::global.has_key?(\$var_info[:id])
	  abort("\nERROR: Variable #{\$var_info[:id]} already defined in global\n")
	else
	  $vars_block::global[\$var_info[:id]] = \$var_info
	end
      else
	if $vars_block::procedures[\$scope_location][:local_vars].has_key?(\$var_info[:id])
	  abort("\nERROR: Variable #{\$var_info[:id]} already defined in #{\$scope_location}\n")
	else
	  $vars_block::procedures[\$scope_location][:local_vars][\$var_info[:id]] = \$var_info
	end
      end
    }
    | FLOAT ID as_float=assignfloat SEMICOLON { 
	\$var_info = { id: $ID.text, type: $FLOAT.text, value: $as_float.value } 
	\$scope_location = $vars_block::scope_location
	if \$scope_location == nil
	    if $vars_block::global.has_key?(\$var_info[:id])
		abort("\nERROR: Variable #{\$var_info[:id]} already defined in global\n")
	    else
		$vars_block::global[\$var_info[:id]] = \$var_info
	    end
	else
	    if $vars_block::procedures[\$scope_location][:local_vars].has_key?(\$var_info[:id])
		abort("\nERROR: Variable #{\$var_info[:id]} already defined in #{\$scope_location}\n")
	    else
		$vars_block::procedures[\$scope_location][:local_vars][\$var_info[:id]] = \$var_info
	    end
	end
    }
    | STRING ID as_string=assignstring SEMICOLON { 
	\$var_info = { id: $ID.text, type: $STRING.text, value: $as_string.value }
	\$scope_location = $vars_block::scope_location
	if \$scope_location == nil
	    if $vars_block::global.has_key?(\$var_info[:id])
		abort("\nERROR: Variable #{\$var_info[:id]} already defined in global\n")
	    else
		$vars_block::global[\$var_info[:id]] = \$var_info
	    end
	else
	    if $vars_block::procedures[\$scope_location][:local_vars].has_key?(\$var_info[:id])
		abort("\nERROR: Variable #{\$var_info[:id]} already defined in #{\$scope_location}\n")
	    else
		$vars_block::procedures[\$scope_location][:local_vars][\$var_info[:id]] = \$var_info
	    end
	end
    }
    | BOOLEAN ID as_boolean=assignboolean SEMICOLON { 
	\$var_info = { id: $ID.text, type: $BOOLEAN.text, value: $as_boolean.value }
	\$scope_location = $vars_block::scope_location
	if \$scope_location == nil
	    if $vars_block::global.has_key?(\$var_info[:id])
		abort("\nERROR: Variable #{\$var_info[:id]} already defined in global\n")
	    else
		$vars_block::global[\$var_info[:id]] = \$var_info
	    end
	else
	    if $vars_block::procedures[\$scope_location][:local_vars].has_key?(\$var_info[:id])
		abort("\nERROR: Variable #{\$var_info[:id]} already defined in #{\$scope_location}\n")
	    else
		$vars_block::procedures[\$scope_location][:local_vars][\$var_info[:id]] = \$var_info
	    end
	end
    }
    | ARRAY data_type=tipo ID COLON exp SEMICOLON { 
	\$var_info = { id: $ID.text, type: "[#{$data_type.type}]" }
	\$scope_location = $vars_block::scope_location
	if \$scope_location == nil
	    if $vars_block::global.has_key?(\$var_info[:id])
		abort("\nERROR: Variable #{\$var_info[:id]} already defined in global\n")
	    else
		$vars_block::global[\$var_info[:id]] = \$var_info
	    end
	else
	    if $vars_block::procedures[\$scope_location][:local_vars].has_key?(\$var_info[:id])
		abort("\nERROR: Variable #{\$var_info[:id]} already defined in #{\$scope_location}\n")
	    else
		$vars_block::procedures[\$scope_location][:local_vars][\$var_info[:id]] = \$var_info
	    end
	end
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

tipo returns[type]:
    INT { $type = $INT.text }
    | FLOAT { $type = $FLOAT.text }
    | STRING { $type = $STRING.text }
    | BOOLEAN { $type = $BOOLEAN.text }
    ;

func:
    | /* empty */
    | funcion func  
    ;

funcion:
    FUNCTION ID { $vars_block::scope_location = $ID.text } LPARENT arguments=argumentos RPARENT COLON return_type=retornofunc { 
      \$ident = $vars_block::scope_location
      if not $vars_block::procedures.has_key?(\$ident)
	$vars_block::procedures[\$ident] = { id: \$ident, args: \$arguments, local_vars: Hash.new, return_type: \$return_type }
      else
	abort("\nERROR: Procedure #{\$ident} already defined\n")
      end
    }
    LBRACK var est RETURN retorno SEMICOLON RBRACK 
    ;

argumentos returns[list]: /* empty */
    | data_type=tipo ref ID more_args=argumentoaux {
        $list = [ {type: $data_type.type, id: $ID.text } ]
        $list.concat(more_args.list) unless more_args.list.nil?
      }
    ;

argumentoaux returns[list]: /* empty */
    | COMMA data_type=tipo ref ID more_args=argumentoaux { 
        $list = [ {type: $data_type.type, id: $ID.text } ]
        $list.concat(more_args.list) unless more_args.list.nil?
      }
    ;

ref: /* empty */
    | REF { print("[REF] ") }
    ;

retornofunc returns[type]:
    VOID { $type=$VOID.text }
    | data_type=tipo { $type=$data_type.type }
    ;

est:
    estatutos estaux { print("[EST] ") }
    ;

estaux: /* empty */
    | estatutos estaux { print("[ESTAUX] ") }
    ;

estatutos:
    ID { 
      \$id = $ID.text
      \$scope_location = $vars_block::scope_location
      if not \$scope_location.nil?
	if $vars_block::procedures[\$scope_location][:local_vars].has_key?(\$id)
	  $vars_block::operands_stack.push( $vars_block::procedures[\$scope_location][:local_vars][\$id] )
	elsif $vars_block::global.has_key?(\$id)
	  $vars_block::operands_stack.push( $vars_block::global[\$id] )
	else
	  abort("\nERROR: Variable #{\$id} not defined in the program\n")
	end
      else
	if $vars_block::global.has_key?(\$id)
	  $vars_block::operands_stack.push( $vars_block::global[\$id] )
	else
	  abort("\nERROR: Variable #{\$id} not defined in the program\n")
	end
      end
    }
    idestatutos SEMICOLON { 
      \$next_operation = $vars_block::operations_stack.look()
      $vars_block::operations_stack.pop()
      \$oper2 = $vars_block::operands_stack.look()
      $vars_block::operands_stack.pop()
      \$oper1 = $vars_block::operands_stack.look()
      $vars_block::operands_stack.pop()
      print("\nop: #{\$next_operation}, op1: #{\$oper1}, op2: #{\$oper2}\n")
      if \$oper1[:type] != $vars_block::semanthic_cube[\$oper1[:type]][\$oper2[:type]][\$next_operation]
	print("\nWARNING: #{$vars_block::semanthic_cube[\$oper1[:type]][\$oper2[:type]][\$next_operation]} to #{\$oper1[:type]}\n")
      end
      \$cuadruple = { op: \$next_operation, op1: \$oper1, op2: nil, dest: \$oper2}
      $vars_block::lines_counter = $vars_block::lines_counter + 1
    }
    | condicion { print("[ESTATUTOS] ") }
    | escritura { print("[ESTATUTOS] ") }
    | ciclo { print("[ESTATUTOS] ") }
    | lectura { print("[ESTATUTOS] ") }
    ;

idestatutos:
    llamada { print("[IDESTATUTOS] ") }
    | array ASSIGN expresion { print("[IDESTATUTOS] ") }
    | ASSIGN {
      $vars_block::operations_stack.push( $ASSIGN.text )
    }
    expresion 
    ;

llamada:
    LPARENT llamadaargs RPARENT { print("[LLAMADA] ") }
    ;

llamadaargs: /* empty */
    | exp llamadaargsaux { print("[LLAMADAARGS] ") }
    ;

llamadaargsaux: /* emtpy */
    | COMMA exp llamadaargsaux { print("[LLAMADAARGSAUX] ") }
    ;

array:
    LSBRACK exp RSBRACK { print("[ARRAY] ") }
    ;

expresion:
    exp /*expresionaux*/ { print("[EXPRESION] ") }
    ;

/* TODO: Correct the grammar in 'comparacion' */
expresionaux: /* empty */
    | comparacion expresion { print("[EXPRESIONAX] ") } 
    | logico expresion { print("[EXPRESIONAX] ") }
    ;

exp:
    termino {
      \$next_operation = $vars_block::operations_stack.look()
      if (not \$next_operation.nil?) && (\$next_operation == '+' || \$next_operation == '-')
	$vars_block::operations_stack.pop()
	\$oper2 = $vars_block::operands_stack.look()
	$vars_block::operations_stack.pop()
	\$oper1 = $vars_block::operands_stack.look()
	$vars_block::operands_stack.pop()
	if (not $vars_block::semanthic_cube[\$oper1[:type]][\$oper2[:type]].nil?) && 
	    (not $vars_block::semanthic_cube[\$oper1[:type]][\$oper2[:type]][\$next_operation].nil?)
	  \$resulting_type = $vars_block::semanthic_cube[\$oper1[:type]][\$oper2[:type]][\$next_operation]
	  \$temp = 't' + $vars_block::next_temp.to_s
	  $vars_block::next_temp = $vars_block::next_temp + 1
	  \$destiny = { id: \$temp, type: \$resulting_type, value: nil }
	  \$cuadruple = { op: \$next_operation, op1: \$oper1, op2: \$oper2, dest: \$destiny }
	  $vars_block::lines_counter = $vars_block::lines_counter + 1
	  $vars_block::cuadruples_array << \$cuadruple
	  $vars_block::operands_stack.push( \$destiny )
	else
	  abort("\nERROR: #{\$oper1[:type]} #{\$next_operation} #{\$oper2[:type]} is invalid\n")
	end
      end
    }      
    expaux
    ;

expaux: /* empty */
    | PLUS {
      $vars_block::operations_stack.push( $PLUS.text )
    }
    exp 
    | MINUS {
      $vars_block::operations_stack.push( $MINUS.text )
    }
    exp 
    ;

termino:
    factor { 
      \$next_operation = $vars_block::operations_stack.look()
      if (not \$next_operation.nil?) && (\$next_operation == '*' || \$next_operation == '/')
	$vars_block::operations_stack.pop()
	\$oper2 = $vars_block::operands_stack.look()
	$vars_block::operations_stack.pop()
	\$oper1 = $vars_block::operands_stack.look()
	$vars_block::operands_stack.pop()
	if (not $vars_block::semanthic_cube[\$oper1[:type]][\$oper2[:type]].nil?) &&
	    (not $vars_block::semanthic_cube[\$oper1[:type]][\$oper2[:type]][\$next_operation].nil?)
	  \$resulting_type = $vars_block::semanthic_cube[\$oper1[:type]][\$oper2[:type]][\$next_operation]
	  \$temp = 't' + $vars_block::next_temp.to_s
	  $vars_block::next_temp = $vars_block::next_temp + 1
	  \$destiny = { id: \$temp, type: \$resulting_type, value: nil }
	  \$cuadruple = { op: \$next_operation, op1: \$oper1, op2: \$oper2, dest: \$destiny }
	  $vars_block::lines_counter = $vars_block::lines_counter + 1
	  $vars_block::cuadruples_array << \$cuadruple
	  $vars_block::operands_stack.push( \$destiny )
	else
	  abort("\nERROR: #{\$oper1[:type]} #{\$next_operation} #{\$oper2[:type]} is invalid\n")
	end
      end
    } 
    terminoaux
    ;

terminoaux: /* empty */
    | TIMES {
      $vars_block::operations_stack.push( $TIMES.text )
    } 
    termino 
    | DIVIDE {
      $vars_block::operations_stack.push( $DIVIDE.text )
    }
    termino 
    ;

/* TODO: Corregir la parte del NOT para parentesis y expresiones, y del signo */
factor:
    NOT notfactor { print("[FACTOR] ") }
    | LPARENT {
      $vars_block::operations_stack.push( $LPARENT.text )
    } exp RPARENT {
      $vars_block::operations_stack.pop()
    }
    /*| sign varcte */
    | varcte {
	$vars_block::sign_variable = nil
    }
    ;

notfactor:
    LPARENT exp RPARENT { print("[NOTFACTOR] ") }
    | varcte { print("[NOTFACTOR] ") }
    ;

sign:
    PLUS {
	$vars_block::sign_variable = $PLUS.text
    }
    | MINUS {
	$vars_block::sign_variable = $MINUS.text
    }
    ;

varcte:
    ID idvarcte {
      \$id = $ID.text
      \$scope_location = $vars_block::scope_location
      \$found = false
      if not \$scope_location.nil? && $vars_block::procedures.has_key?(\$scope_location)
	if $vars_block::procedures[\$scope_location][:local_vars].has_key?(\$id)
	  \$var = $vars_block::procedures[\$scope_location][:local_vars][\$id]
	  \$found = true
	end
      end
      if not \$found
	if $vars_block::global.has_key?(\$id)
	  \$var = $vars_block::global[\$id]
	else
	  abort("\nERROR: Variable #{\$id} is not defined\n")
	end
      end
      if not $vars_block::sign_variable.nil?
	if \$var[:type] == 'string'
	  abort("\nERROR: Cannot apply #{$vars_block::sign_variable} to string #{\$var[:id]}\n")
	elsif \$var[:type] == 'boolean'
	  abort("\nERRO: Cannot apply #{$vars_block::sign_variable} to boolean #{\$var[:id]}\n")
	elsif $vars_block::sign_variable == '-'
	  \$var[:value] = - \$var[:value]
	  $vars_block::sign_variable = nil
	end
      end
      $vars_block::operands_stack.push( \$var )
    }
    | CTEI {
      \$var = { id: nil, type: 'int', value: $CTEI.text.to_i }
      if not $vars_block::sign_variable.nil? && $vars_block::sign_variable == '-'
	\$var[:value] = - \$var[:value]
	$vars_block::sign_variable = nil
      end
      $vars_block::operands_stack.push( \$var )
    }
    | CTEF {
      \$var = { id: nil, type: 'float', value: $CTEF.text.to_f }
      if not $vars_block::sign_variable.nil? && $vars_block::sign_variable == '-'
        \$var[:value] = - \$var[:value]
        $vars_block::sign_variable = nil
      end
      $vars_block::operands_stack.push( \$var )
    }
    | CTES { 
      if not $vars_block::sign_variable.nil?
	abort("\nERROR: You cannot apply '+' or '-' to the string #{$CTES.text}\n")
      end
      $vars_block::operands_stack.push({ id: nil, type: 'string', value: $CTES.text })
    }
    | CTEB { 
      if not $vars_block::sign_variable.nil?
	abort("\nERROR: You cannot apply '+' or '-' to boolean\n")
      end
      $vars_block::operands_stack.push({ id: nil, type: 'boolean', value: $CTEB.text == 'true' })
    }
    ;

idvarcte: /* empty */
    | llamada { print("[IDVARCTE] ") }
    | array { print("[IDVARCTE] ") }
    ;

comparacion:
    LT { 
	$vars_block::operations_stack.push( $LT.text )
    }
    | LE { 
	$vars_block::operations_stack.push( $LE.text )
    }
    | GT { 
	$vars_block::operations_stack.push( $GT.text )
    }
    | GE {
	$vars_block::operations_stack.push( $GE.text )
    }
    | EQ {
	$vars_block::operations_stack.push( $EQ.text )
    }
    | NE { print("[COMPARACION] ") }
    ;

logico:
    AND {
	$vars_block::operations_stack.push( $AND.text )
    }
    | OR { 
	$vars_block::operations_stack.push( $OR.text )
    }
    ;

retorno: /* empty */
    | exp { print("[RETORNO] ") }
    ;

condicion:
    IF LPARENT expresion RPARENT LBRACK est RBRACK elsecondicion { print("[CONDICION] ") }
    ;

elsecondicion: /* empty */
    | ELSE LBRACK est RBRACK { print("[ELSECONDICION] ") }
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
    FOR LPARENT cicloaux SEMICOLON expresion SEMICOLON cicloaux RPARENT LBRACK est RBRACK { print("[CICLO] ") }
    ;

cicloaux: /* empty */
    | ID cicloauxx ASSIGN exp { print("[CICLOAUX] ") }
    ;

cicloauxx: /* empty */
    | array { print("[CICLOAUXX] ") }
    ;

lectura:
    INPUT LPARENT tipo COMMA ID RPARENT SEMICOLON { print("[LECTURA] ") }
    ;

main:
    MAIN { 
	$vars_block::scope_location = $MAIN.text 
	if not $vars_block::procedures.has_key?($vars_block::scope_location)
	  $vars_block::procedures[$vars_block::scope_location] = { id: $vars_block::scope_location, args: nil, local_vars: Hash.new, return_type: 'void' }
	else
	  abort("\nERROR: The program can only have one main procedure\n")
	end
    } LPARENT RPARENT LBRACK var est RBRACK  { print("[MAIN] ") }
    ;
