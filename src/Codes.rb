# Author: Teodoro Vargas Cortes A00808903
# Codes for the cuadruples and for the virtual machine

require 'json'

module CODES

  Codes = {
    INT: 0,
    FLOAT: 1,
    BOOLEAN: 2,
    STRING: 3,
    ARRAY: 4,
    VOID: 5,
    GOTO: 6,
    GOTOF: 7,
    GOTOV: 8,
    ASSIGN: 9,
    LT: 10,
    LE: 11,
    GT: 12,
    GE: 13,
    EQ: 14,
    NE: 15,
    NOT: 16,
    AND: 17,
    OR: 18,
    PLUS: 19,
    MINUS: 20,
    TIMES: 21,
    DIVIDE: 22,
    ERA: 23,
    PARAM: 24,
    GOSUB: 25,
    GOEND: 26,
    RET: 27,
    LPARENT: 28,
    RPARENT: 29,
    PRINT: 30,
    INPUT: 31
  }

  # Returns the corresponding value for the string token
  # Params:
  # +token+:: A string representing the token
  # Returns:
  # +value+:: Value according with the code defined above
  def CODES.tokenValue(token)
    token.downcase!
    case token
    when 'int'
      value = Codes[:INT]
    when 'float'
      value = Codes[:FLOAT]
    when 'boolean'
      value = Codes[:BOOLEAN]
    when 'string'
      value = Codes[:STRING]
    when 'array'
      value = Codes[:ARRAY]
    when 'void'
      value = Codes[:VOID]
    when 'goto'
      value = Codes[:GOTO]
    when 'gotof'
      value = Codes[:GOTOF]
    when 'gotov'
      value = Codes[:GOTOV]
    when 'assign'
      value = Codes[:ASSIGN]
    when '='
      value = Codes[:ASSIGN]
    when 'lt'
      value = Codes[:LT]
    when '<'
      value = Codes[:LT]
    when 'le'
      value = Codes[:LE]
    when '<='
      value = Codes[:LE]
    when 'gt'
      value = Codes[:GT]
    when '>'
      value = Codes[:GT]
    when 'ge'
      value = Codes[:GE]
    when '>='
      value = Codes[:GE]
    when 'eq'
      value = Codes[:EQ]
    when '=='
      value = Codes[:EQ]
    when 'ne'
      value = Codes[:NE]
    when '!='
      value = Codes[:NE]
    when 'not'
      value = Codes[:NOT]
    when 'and'
      value = Codes[:AND]
    when 'or'
      value = Codes[:OR]
    when 'plus'
      value = Codes[:PLUS]
    when '+'
      value = Codes[:PLUS]
    when 'minus'
      value = Codes[:MINUS]
    when '-'
      value = Codes[:MINUS]
    when 'times'
      value = Codes[:TIMES]
    when '*'
      value = Codes[:TIMES]
    when 'divide'
      value = Codes[:DIVIDE]
    when '/'
      value = Codes[:DIVIDE]
    when 'era'
      value = Codes[:ERA]
    when 'param'
      value = Codes[:PARAM]
    when 'gosub'
      value = Codes[:GOSUB]
    when 'goend'
      value = Codes[:GOEND]
    when 'ret'
      value = Codes[:RET]
    when 'lparent'
      value = Codes[:LPARENT]
    when 'rparent'
      value = Codes[:RPARENT]
    when 'print'
      value = Codes[:PRINT]
    when 'input'
      value = Codes[:INPUT]
    end
    value
  end

  # Transforms the Codes hash to json
  def CODES.Codes_to_json
    Codes.to_json
  end

end
