/* 
 * Simple
 * A simple progrramming language
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

// Scanner Rules
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

// Parser Rules
// block to keep the recognized variables
vars_block
scope {
  global;
}
@init {
  $vars_block::global = Hash.new;
}
@after {
  puts("\n\nFound this global variables: \n")
  $vars_block::global.keys.sort.each do | key |
    \$var_info = $vars_block::global[key]
    print("#{key} : type=#{\$var_info[:type]}, value=#{\$var_info[:value]}\n")
  end
}
  : programa
  ;


programa:
    global=var func main {
          $global.vars_array.each do | var_info |
            unless var_info.nil?
              if $vars_block::global.has_key?(var_info[:id])
                print("\nERROR: Variable already defined in global\n")
              else
                $vars_block::global[var_info[:id]] = var_info
              end
            end
          end
       }
    ;

var returns[vars_array]:
    | /* empty */
    | single_var=variables vars=var { 
        $vars_array = [single_var.var_info]
        $vars_array.concat(vars.vars_array) unless vars.vars_array.nil?
      }
    ;

variables returns[var_info]:
    INT ID as_int=assignint SEMICOLON { $var_info = { id: $ID.text, type: $INT.text, value: $as_int.value } }
    | FLOAT ID as_float=assignfloat SEMICOLON { $var_info = { id: $ID.text, type: $FLOAT.text, value: $as_float.value } }
    | STRING ID as_string=assignstring SEMICOLON { $var_info = { id: $ID.text, type: $STRING.text, value: $as_string.value }}
    | BOOLEAN ID as_boolean=assignboolean SEMICOLON { $var_info = { id: $ID.text, type: $BOOLEAN.text, value: $as_boolean.value }}
    | ARRAY data_type=tipo ID COLON exp SEMICOLON { $var_info = { id: $ID.text, type: "[#{$data_type.type}]" }  } //TODO: missing size of array
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
    | ASSIGN CTEB { $value = $CTEB.text == 'true' } // Convert string to boolean
    ;

tipo returns[type]:
    INT { $type = $INT.text }
    | FLOAT { $type = $FLOAT.text }
    | STRING { $type = $STRING.text }
    | BOOLEAN { $type = $BOOLEAN.text }
    ;

func: /* empty */
    | funcion func { print("[FUNC] ") }
    ;

funcion:
    FUNCTION ID LPARENT argumentos RPARENT COLON retornofunc LBRACK var est RETURN retorno SEMICOLON RBRACK { print("[FUNCTION] ") }
    ;

argumentos: /* empty */
    | tipo ref ID argumentoaux { print("[ARGUMENTOS] ") }
    ;

argumentoaux: /* empty */
    | COMMA tipo ref ID argumentoaux { print("[ARGUMENTOAUX] ") }
    ;

ref: /* empty */
    | REF { print("[REF] ") }
    ;

retornofunc:
    VOID { print("[RETORNOFUNC] ") }
    | tipo { print("[RETORNOFUNC] ") }
    ;

est:
    estatutos estaux { print("[EST] ") }
    ;

estaux: /* empty */
    | estatutos estaux { print("[ESTAUX] ") }
    ;

estatutos:
    ID idestatutos SEMICOLON { print("[ESTATUTOS] ") }
    | condicion { print("[ESTATUTOS] ") }
    | escritura { print("[ESTATUTOS] ") }
    | ciclo { print("[ESTATUTOS] ") }
    | lectura { print("[ESTATUTOS] ") }
    ;

idestatutos:
    llamada { print("[IDESTATUTOS] ") }
    | array ASSIGN expresion { print("[IDESTATUTOS] ") }
    | ASSIGN expresion { print("[IDESTATUTOS] ") }
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
    exp expresionaux { print("[EXPRESION] ") }
    ;

expresionaux: /* empty */
    | comparacion expresion { print("[EXPRESIONAX] ") }
    | logico expresion { print("[EXPRESIONAX] ") }
    ;

exp:
    termino expaux { print("[EXP] ") }
    ;

expaux: /* empty */
    | PLUS exp { print("[EXPAUX] ") }
    | MINUS exp { print("[EXPAUX] ") }
    ;

termino:
    factor terminoaux { print("[TERMINO] ") }
    ;

terminoaux: /* empty */
    | TIMES termino { print("[TERMINOAUX] ") }
    | DIVIDE termino { print("[TERMINOAUX] ") }
    ;

factor:
    NOT notfactor { print("[FACTOR] ") }
    | sign varcte { print("[FACTOR] ") }
    | varcte { print("[FACTOR] ") }
    ;

notfactor:
    LPARENT exp RPARENT { print("[NOTFACTOR] ") }
    | varcte { print("[NOTFACTOR] ") }
    ;

sign:
    PLUS { print("[SIGN] ") }
    | MINUS { print("[SIGN] ") }
    ;

varcte:
    ID idvarcte { print("[VARCTE] ") }
    | CTEI { print("[VARCTE] ") }
    | CTEF { print("[VARCTE] ") }
    | CTES { print("[VARCTE] ") }
    | CTEB { print("[VARCTE] ") }
    ;

idvarcte: /* empty */
    | llamada { print("[IDVARCTE] ") }
    | array { print("[IDVARCTE] ") }
    ;

comparacion:
    LT { print("[COMPARACION] ") }
    | LE { print("[COMPARACION] ") }
    | GT { print("[COMPARACION] ") }
    | GE { print("[COMPARACION] ") }
    | EQ { print("[COMPARACION] ") }
    | NE { print("[COMPARACION] ") }
    ;

logico:
    AND { print("[LOGICO] ") }
    | OR { print("[LOGICO] ") }
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
    MAIN LPARENT RPARENT LBRACK var est RBRACK  { print("[MAIN] ") }
    ;
