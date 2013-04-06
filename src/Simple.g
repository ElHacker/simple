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
	auxiliar;
}

@init {
	$vars_block::auxiliar = Auxiliar.new
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
    print("#{key} : #{\$proc_info}\n")
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
      \$var_info = { id: $ID.text, type: $INT.text, value: $as_int.value }
			$vars_block::auxiliar.addVariable(\$var_info)
    }
    | FLOAT ID as_float=assignfloat SEMICOLON { 
			\$var_info = { id: $ID.text, type: $FLOAT.text, value: $as_float.value } 
			$vars_block::auxiliar.addVariable(\$var_info)
    }
    | STRING ID as_string=assignstring SEMICOLON { 
			\$var_info = { id: $ID.text, type: $STRING.text, value: $as_string.value }
			$vars_block::auxiliar.addVariable(\$var_info)
    }
    | BOOLEAN ID as_boolean=assignboolean SEMICOLON { 
			\$var_info = { id: $ID.text, type: $BOOLEAN.text, value: $as_boolean.value }
			$vars_block::auxiliar.addVariable(\$var_info)
    }
    | ARRAY data_type=tipo ID COLON exp SEMICOLON { 
			\$var_info = { id: $ID.text, type: "[#{$data_type.type}]" }
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

tipo returns[type]:
    INT { $type = 'int' }
    | FLOAT { $type = 'float' }
    | STRING { $type = 'string' }
    | BOOLEAN { $type = 'boolean' }
    ;

func:
    | /* empty */
    | funcion func  
    ;

funcion:
    FUNCTION ID { 
			$vars_block::auxiliar.scope_location = $ID.text
		} LPARENT arguments=argumentos RPARENT COLON return_type=retornofunc { 
			$vars_block::auxiliar.addProcedure(\$arguments, \$return_type)
    } LBRACK var est RETURN retorno SEMICOLON RBRACK {
			$vars_block::auxiliar.scope_location = nil
		}
    ;

argumentos returns[list]: /* empty */
    | data_type=tipo ref ID more_args=argumentoaux {
        $list = [ {type: $data_type.text, id: $ID.text } ]
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
    VOID { $type = 'void' }
    | data_type=tipo { $type = $data_type.text }
    ;

est:
    estatutos estaux { print("[EST] ") }
    ;

estaux: /* empty */
    | estatutos estaux { print("[ESTAUX] ") }
    ;

estatutos:
    ID { 
      $vars_block::auxiliar.addVariableToOperadStack( $ID.text )
    } idestatutos SEMICOLON  
    | condicion { print("[ESTATUTOS] ") }
    | escritura { print("[ESTATUTOS] ") }
    | ciclo { print("[ESTATUTOS] ") }
    | lectura { print("[ESTATUTOS] ") }
    ;

idestatutos:
    llamada { print("[IDESTATUTOS] ") }
    | array ASSIGN expresion { print("[IDESTATUTOS] ") }
    | ASSIGN {
      $vars_block::auxiliar.operations_stack.push( $ASSIGN.text )
    } expresion {
      \$next_operation = $vars_block::auxiliar.operations_stack.look()
      $vars_block::auxiliar.operations_stack.pop()
      \$oper1 = $vars_block::auxiliar.operands_stack.look()
      $vars_block::auxiliar.operands_stack.pop()
      \$oper2 = $vars_block::auxiliar.operands_stack.look()
      $vars_block::auxiliar.operands_stack.pop()
      $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper2, \$oper1)
      \$cuadruple = Cuadruples.new(\$next_operation, \$oper1, nil, \$oper2)
      $vars_block::auxiliar.lines_counter = $vars_block::auxiliar.lines_counter + 1
      $vars_block::auxiliar.cuadruples_array << \$cuadruple 
    }
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
      \$next_operation = $vars_block::auxiliar.operations_stack.look()
			if (not \$next_operation.nil?) && (\$next_operation == '+' || \$next_operation == '-')
				$vars_block::auxiliar.operations_stack.pop()
				\$oper2 = $vars_block::auxiliar.operands_stack.look()
				$vars_block::auxiliar.operands_stack.pop()
				\$oper1 = $vars_block::auxiliar.operands_stack.look()
				$vars_block::auxiliar.operands_stack.pop()
				\$resulting_type = $vars_block::auxiliar.checkCuadruple(\$next_operation, \$oper1, \$oper2)
				# In the future, use the nextTemporalVariable
				\$temp = 't' + $vars_block::auxiliar.next_temp.to_s
				$vars_block::auxiliar.next_temp = $vars_block::auxiliar.next_temp + 1
				\$destiny = { id: \$temp, type: \$resulting_type, value: nil }
				\$cuadruple = Cuadruples.new(\$next_operation, \$oper1, \$oper2, \$destiny)
				$vars_block::auxiliar.lines_counter = $vars_block::auxiliar.lines_counter + 1
				$vars_block::auxiliar.cuadruples_array << \$cuadruple
				$vars_block::auxiliar.operands_stack.push( \$destiny )
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
				\$temp = 't' + $vars_block::auxiliar.next_temp.to_s
				$vars_block::auxiliar.next_temp = $vars_block::auxiliar.next_temp + 1
				\$destiny = { id: \$temp, type: \$resulting_type, value: nil }
				\$cuadruple = Cuadruples.new(\$next_operation, \$oper1, \$oper2, \$destiny)
				$vars_block::auxiliar.lines_counter = $vars_block::auxiliar.lines_counter + 1
				$vars_block::auxiliar.cuadruples_array << \$cuadruple
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

/* TODO: Corregir la parte del NOT para parentesis y expresiones, y del signo */
factor:
    NOT notfactor { print("[FACTOR] ") }
    | LPARENT {
      $vars_block::auxiliar.operations_stack.push( $LPARENT.text )
    } exp RPARENT {
      $vars_block::auxiliar.operations_stack.pop()
    }
    /*| sign varcte */
    | varcte
    ;

notfactor:
    LPARENT exp RPARENT { print("[NOTFACTOR] ") }
    | varcte { print("[NOTFACTOR] ") }
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
    ID idvarcte {
      \$id = $ID.text
			\$var = $vars_block::auxiliar.findVariable(\$id)
			if not $vars_block::auxiliar.sign_variable.nil?
				if \$var[:type] == 'string'
					abort("\nERROR: Cannot apply #{$vars_block::auxiliar.sign_variable} to string #{\$var[:id]}\n")
				elsif \$var[:type] == 'boolean'
					abort("\nERRO: Cannot apply #{$vars_block::auxiliar.sign_variable} to boolean #{\$var[:id]}\n")
				elsif $vars_block::auxiliar.sign_variable == '-'
					\$var[:value] = - \$var[:value]
					$vars_block::auxiliar.sign_variable = nil
				end
			end
			$vars_block::auxiliar.operands_stack.push( \$var )
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

idvarcte: /* empty */
    | llamada { print("[IDVARCTE] ") }
    | array { print("[IDVARCTE] ") }
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
    | NE { print("[COMPARACION] ") }
    ;

logico:
    AND {
	$vars_block::auxiliar.operations_stack.push( $AND.text )
    }
    | OR { 
	$vars_block::auxiliar.operations_stack.push( $OR.text )
    }
    ;

retorno: /* empty */
    | exp { print("[RETORNO] ") }
    ;

condicion:
    IF LPARENT expresion RPARENT {
      # Generate
      # GotoF, condition,nil,__
      # Push count-1 to jumps stack
      \$goto_false = "GotoF"
      \$condition = $vars_block::auxiliar.operands_stack.look()
      \$count = $vars_block::auxiliar.lines_counter
      $vars_block::auxiliar.jumps_stack.push(\$count)
      # $vars_block::auxiliar.checkCuadruple(\$goto_false, \$condition, nil)
      \$cuadruple = Cuadruples.new(\$goto_false, \$condition, nil, nil)
      $vars_block::auxiliar.lines_counter = $vars_block::auxiliar.lines_counter + 1
      $vars_block::auxiliar.cuadruples_array << \$cuadruple 
    } LBRACK est RBRACK elsecondicion { 
      # jump = pop(jumps_stack)
      # fill(jump, count)
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
      # $vars_block::auxiliar.checkCuadruple(\$goto_line, nil, nil)
      \$cuadruple = Cuadruples.new(\$goto_line, nil, nil, nil)
      $vars_block::auxiliar.cuadruples_array << \$cuadruple
      $vars_block::auxiliar.lines_counter += 1
      $vars_block::auxiliar.jumps_stack.push(\$count)
      $vars_block::auxiliar.cuadruples_array[\$jump].destiny = \$count
    } LBRACK est RBRACK { print("[ELSECONDICION] ") }
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
      $vars_block::auxiliar.jumps_stack.push( $vars_block::auxiliar.lines_counter )
    } expresion SEMICOLON {
      \$condition = $vars_block::auxiliar.operands_stack.look()
      $vars_block::auxiliar.operands_stack.pop()
      # Insert the next line cuadruple in jumps_stack
      $vars_block::auxiliar.jumps_stack.push( $vars_block::auxiliar.lines_counter )
      # Create the GotoF cuadruple
      \$goto_line = "GotoF"
      \$cuadruple = Cuadruple.new(\$goto_line, \$condition, nil, nil)
      $vars_block::auxiliar.lines_counter += 1
      # Insert the next line cuadruple in jumps_stack
      $vars_block::auxiliar.jumps_stack.push( $vars_block::auxiliar.lines_counter )
      # Create the Goto cuadruple
      \$goto_line = "Goto"
      \$cuadruple = Cuadruple.new(\$goto_line, nil, nil, nil)
      $vars_block::auxiliar.lines_counter += 1
      # Insert the next line cuadruple in jumps_stack
      $vars_block::auxiliar.jumps_stack.push( $vars_block::auxiliar.lines_counter )
    } cicloaux RPARENT {
      \$aux_jumps = Stack.new
      3.times {
	\$aux_jumps.push( $vars_block::auxiliar.jumps_stack.look() )
	$vars_block::auxiliar.jumps_stack.pop()
      }
      # Start of the for condition
      \$for_cond_ini = $vars_block::auxiliar.jumps_stack.look()
      $vars_block::auxiliar.jumps_stack.pop()
      # Create a Goto cuadruple
      \$goto_line = "Goto"
      \$cuadruple = Cuadruple.new(\$goto_line, nil, nil, \$for_cond_ini)
      $vars_block::auxiliar.cuadruples.push( \$cuadruple )
      $vars_block::auxiliar.lines_counter += 1
      # Transfer one line from aux_jumps to jumps_stack
      $vars_block::auxiliar.jumps_stack.push( \$aux_jumps.look() )
      \$aux_jumps.pop()
      # Get the line of the Goto cuadruple in the for
      \$for_cond_true = \$aux_jumps.look()
      \$aux_jumps.pop()
      # Fill that cuadruple with the next cuadruple line
      $vars_block::auxiliar.cuadruples[\$for_cond_true].destiny = $vars_block::auxiliar.lines_counter
      # Transfer another line from aux_jumps to jumps_stack
      # Transfer one line from aux_jumps to jumps_stack
      $vars_block::auxiliar.jumps_stack.push( \$aux_jumps.look() )
      \$aux_jumps.pop()
    } LBRACK est RBRACK {
      # Get the line of the for's increment cuadruple
      \$for_increment = $vars_block::auxiliar.jumps_stack.look()
      $vars_block::auxiliar.jumps_stack.pop()
      # Create a Goto cuadruple with that destination
      \$goto_line = "Goto"
      \$cuadruple = Cuadruple.new(\$goto_line, nil, nil, \$for_increment)
      $vars_block::auxiliar.cuadruples.push( \$cuadruple )
      $vars_block::auxiliar.lines_counter += 1
      # Get the line of the GotoF cuadruple in the for
      \$for_cond_false = $vars_block::auxiliar.jumps_stack.look()
      $vars_block::auxiliar.jumps_stack.pop()
      # Fill that cuadruple
      $vars_block::auxiliar.cuadruples[\$for_cond_false].destiny = $vars_block::auxiliar.lines_counter
    }
    ;

cicloaux: /* empty */
    | ID {
      $vars_block::auxiliar.addVariableToOperadStack( $ID.text )
      # For now, we ignore the array
    } cicloauxx ASSIGN {
      # Change this with the value for '='
      $vars_block::auxiliar.operations_stack.push( $ASSIGN.text )
    } exp
    ;

cicloauxx: /* empty */
    | array { print("[CICLOAUXX] ") }
    ;

lectura:
    INPUT LPARENT tipo COMMA ID RPARENT SEMICOLON { print("[LECTURA] ") }
    ;

main:
    MAIN { 
			$vars_block::auxiliar.scope_location = $MAIN.text 
			if not $vars_block::auxiliar.procedures.has_key?($vars_block::auxiliar.scope_location)
				$vars_block::auxiliar.addProcedure(nil, 'void')
			else
				abort("\nERROR: The program can only have one main procedure\n")
			end
    } LPARENT RPARENT LBRACK var est RBRACK  { print("[MAIN] ") }
    ;
