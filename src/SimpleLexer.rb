#!/usr/bin/env ruby
#
# Simple.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Simple.g
# Generated at: 2013-03-17 17:38:15
# 

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$LOAD_PATH.unshift( this_directory ) unless $LOAD_PATH.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!
  
Failed to load the ANTLR3 runtime library (version 1.8.11):

Ensure the library has been installed on your system and is available
on the load path. If rubygems is available on your system, this can
be done with the command:
  
  gem install antlr3

Current load path:
#{ load_path }

  END
end

defined?( ANTLR3 ) or begin
  
  # 1: try to load the ruby antlr3 runtime library from the system path
  require 'antlr3'
  
rescue LoadError
  
  # 2: try to load rubygems if it isn't already loaded
  defined?( Gem ) or begin
    require 'rubygems'
  rescue LoadError
    antlr_load_failed.call
  end
  
  # 3: try to activate the antlr3 gem
  begin
    Gem.activate( 'antlr3', '~> 1.8.11' )
  rescue Gem::LoadError
    antlr_load_failed.call
  end
  
  require 'antlr3'
  
end
# <~~~ end load path setup


module Simple
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :FUNCTION => 11, :LT => 19, :MAIN => 9, :LBRACK => 28, 
                   :DIGITS => 42, :INPUT => 17, :FOR => 13, :FLOAT => 5, 
                   :NOT => 25, :AND => 26, :NormalChar => 45, :ID => 49, 
                   :EOF => -1, :RSBRACK => 33, :Identifier => 48, :IF => 14, 
                   :BOOLEAN => 6, :COMMA => 34, :SpecialChar => 51, :RETURN => 12, 
                   :PLUS => 38, :VOID => 10, :EQ => 23, :ARRAY => 8, :DIVIDE => 41, 
                   :NE => 24, :RBRACK => 29, :GE => 22, :RPARENT => 31, 
                   :CTES => 46, :CTEF => 44, :ELSE => 15, :CTEI => 43, :WHITESPACE => 50, 
                   :LPARENT => 30, :INT => 4, :SEMICOLON => 36, :CTEB => 47, 
                   :MINUS => 39, :PRINT => 16, :LSBRACK => 32, :REF => 35, 
                   :COLON => 37, :OR => 27, :ASSIGN => 18, :GT => 21, :TIMES => 40, 
                   :LE => 20, :STRING => 7 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Simple
    include TokenData

    
    begin
      generated_using( "Simple.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "INT", "FLOAT", "BOOLEAN", "STRING", "ARRAY", "MAIN", 
                     "VOID", "FUNCTION", "RETURN", "FOR", "IF", "ELSE", 
                     "PRINT", "INPUT", "ASSIGN", "LT", "LE", "GT", "GE", 
                     "EQ", "NE", "NOT", "AND", "OR", "LBRACK", "RBRACK", 
                     "LPARENT", "RPARENT", "LSBRACK", "RSBRACK", "COMMA", 
                     "REF", "SEMICOLON", "COLON", "PLUS", "MINUS", "TIMES", 
                     "DIVIDE", "CTEI", "CTEF", "CTES", "CTEB", "ID", "WHITESPACE", 
                     "Identifier", "SpecialChar", "NormalChar", "DIGITS" ].freeze
    RULE_METHODS = [ :int!, :float!, :boolean!, :string!, :array!, :main!, 
                     :void!, :function!, :return!, :for!, :if!, :else!, 
                     :print!, :input!, :assign!, :lt!, :le!, :gt!, :ge!, 
                     :eq!, :ne!, :not!, :and!, :or!, :lbrack!, :rbrack!, 
                     :lparent!, :rparent!, :lsbrack!, :rsbrack!, :comma!, 
                     :ref!, :semicolon!, :colon!, :plus!, :minus!, :times!, 
                     :divide!, :ctei!, :ctef!, :ctes!, :cteb!, :id!, :whitespace!, 
                     :identifier!, :special_char!, :normal_char!, :digits! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule int! (INT)
    # (in Simple.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 24:6: 'int'
      match( "int" )
      # --> action
       print("<INT> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )

    end

    # lexer rule float! (FLOAT)
    # (in Simple.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = FLOAT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 25:8: 'float'
      match( "float" )
      # --> action
       print("<FLOAT> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )

    end

    # lexer rule boolean! (BOOLEAN)
    # (in Simple.g)
    def boolean!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = BOOLEAN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 26:10: 'boolean'
      match( "boolean" )
      # --> action
       print("<BOOLEAN> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )

    end

    # lexer rule string! (STRING)
    # (in Simple.g)
    def string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = STRING
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 27:9: 'string'
      match( "string" )
      # --> action
       print("<STRING> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )

    end

    # lexer rule array! (ARRAY)
    # (in Simple.g)
    def array!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      type = ARRAY
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 28:8: 'array'
      match( "array" )
      # --> action
       print("<ARRAY> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )

    end

    # lexer rule main! (MAIN)
    # (in Simple.g)
    def main!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      type = MAIN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 29:7: 'main'
      match( "main" )
      # --> action
       print("<MAIN> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )

    end

    # lexer rule void! (VOID)
    # (in Simple.g)
    def void!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      type = VOID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 30:7: 'void'
      match( "void" )
      # --> action
       print("<VOID> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )

    end

    # lexer rule function! (FUNCTION)
    # (in Simple.g)
    def function!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      type = FUNCTION
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 31:11: 'function'
      match( "function" )
      # --> action
       print("<FUNCTION> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )

    end

    # lexer rule return! (RETURN)
    # (in Simple.g)
    def return!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      type = RETURN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 32:9: 'return'
      match( "return" )
      # --> action
       print("<RETURN> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )

    end

    # lexer rule for! (FOR)
    # (in Simple.g)
    def for!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      type = FOR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 33:6: 'for'
      match( "for" )
      # --> action
       print("<FOR> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule if! (IF)
    # (in Simple.g)
    def if!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      type = IF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 34:5: 'if'
      match( "if" )
      # --> action
       print("<IF> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule else! (ELSE)
    # (in Simple.g)
    def else!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      type = ELSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 35:7: 'else'
      match( "else" )
      # --> action
       print("<ELSE> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )

    end

    # lexer rule print! (PRINT)
    # (in Simple.g)
    def print!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = PRINT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 36:8: 'print'
      match( "print" )
      # --> action
       print("<PRINT> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )

    end

    # lexer rule input! (INPUT)
    # (in Simple.g)
    def input!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      type = INPUT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 37:8: 'input'
      match( "input" )
      # --> action
       print("<INPUT> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule assign! (ASSIGN)
    # (in Simple.g)
    def assign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      type = ASSIGN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 38:9: '='
      match( 0x3d )
      # --> action
       print("<ASSIGN> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )

    end

    # lexer rule lt! (LT)
    # (in Simple.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 39:5: '<'
      match( 0x3c )
      # --> action
       print("<LT> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )

    end

    # lexer rule le! (LE)
    # (in Simple.g)
    def le!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      type = LE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 40:5: '<='
      match( "<=" )
      # --> action
       print("<LE> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )

    end

    # lexer rule gt! (GT)
    # (in Simple.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 41:5: '>'
      match( 0x3e )
      # --> action
       print("<GT> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )

    end

    # lexer rule ge! (GE)
    # (in Simple.g)
    def ge!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      type = GE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 42:5: '>='
      match( ">=" )
      # --> action
       print("<GE> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )

    end

    # lexer rule eq! (EQ)
    # (in Simple.g)
    def eq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      type = EQ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 43:5: '=='
      match( "==" )
      # --> action
       print("<EQ> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )

    end

    # lexer rule ne! (NE)
    # (in Simple.g)
    def ne!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      type = NE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 44:5: '!='
      match( "!=" )
      # --> action
       print("<NE> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )

    end

    # lexer rule not! (NOT)
    # (in Simple.g)
    def not!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      type = NOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 45:6: 'not'
      match( "not" )
      # --> action
       print("<NOT> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )

    end

    # lexer rule and! (AND)
    # (in Simple.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )

      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 46:6: 'and'
      match( "and" )
      # --> action
       print("<AND> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )

    end

    # lexer rule or! (OR)
    # (in Simple.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )

      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 47:5: 'or'
      match( "or" )
      # --> action
       print("<OR> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )

    end

    # lexer rule lbrack! (LBRACK)
    # (in Simple.g)
    def lbrack!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )

      type = LBRACK
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 48:9: '{'
      match( 0x7b )
      # --> action
       print("<LBRACK> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 25 )

    end

    # lexer rule rbrack! (RBRACK)
    # (in Simple.g)
    def rbrack!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )

      type = RBRACK
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 49:9: '}'
      match( 0x7d )
      # --> action
       print("<RBRACK> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 26 )

    end

    # lexer rule lparent! (LPARENT)
    # (in Simple.g)
    def lparent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )

      type = LPARENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 50:10: '('
      match( 0x28 )
      # --> action
       print("<LPARENT> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )

    end

    # lexer rule rparent! (RPARENT)
    # (in Simple.g)
    def rparent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )

      type = RPARENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 51:10: ')'
      match( 0x29 )
      # --> action
       print("<RPARENT> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )

    end

    # lexer rule lsbrack! (LSBRACK)
    # (in Simple.g)
    def lsbrack!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )

      type = LSBRACK
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 52:10: '['
      match( 0x5b )
      # --> action
       print("<LSBRACK> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )

    end

    # lexer rule rsbrack! (RSBRACK)
    # (in Simple.g)
    def rsbrack!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )

      type = RSBRACK
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 53:10: ']'
      match( 0x5d )
      # --> action
       print("<RSBRACK> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )

    end

    # lexer rule comma! (COMMA)
    # (in Simple.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )

      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 54:8: ','
      match( 0x2c )
      # --> action
       print("<COMMA> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )

    end

    # lexer rule ref! (REF)
    # (in Simple.g)
    def ref!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )

      type = REF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 55:6: '&'
      match( 0x26 )
      # --> action
       print("<REF> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )

    end

    # lexer rule semicolon! (SEMICOLON)
    # (in Simple.g)
    def semicolon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      type = SEMICOLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 56:12: ';'
      match( 0x3b )
      # --> action
       print("<SEMICOLON> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )

    end

    # lexer rule colon! (COLON)
    # (in Simple.g)
    def colon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      type = COLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 57:8: ':'
      match( 0x3a )
      # --> action
       print("<COLON> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )

    end

    # lexer rule plus! (PLUS)
    # (in Simple.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )

      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 58:7: '+'
      match( 0x2b )
      # --> action
       print("<PLUS> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )

    end

    # lexer rule minus! (MINUS)
    # (in Simple.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )

      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 59:8: '-'
      match( 0x2d )
      # --> action
       print("<MINUS> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )

    end

    # lexer rule times! (TIMES)
    # (in Simple.g)
    def times!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )

      type = TIMES
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 60:8: '*'
      match( 0x2a )
      # --> action
       print("<TIMES> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )

    end

    # lexer rule divide! (DIVIDE)
    # (in Simple.g)
    def divide!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )

      type = DIVIDE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 61:9: '/'
      match( 0x2f )
      # --> action
       print("<DIVIDE> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )

    end

    # lexer rule ctei! (CTEI)
    # (in Simple.g)
    def ctei!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )

      type = CTEI
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 62:7: DIGITS
      digits!
      # --> action
       print("<CTEI> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )

    end

    # lexer rule ctef! (CTEF)
    # (in Simple.g)
    def ctef!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )

      type = CTEF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 63:7: DIGITS '.' DIGITS
      digits!
      match( 0x2e )
      digits!
      # --> action
       print("<CTEF> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )

    end

    # lexer rule ctes! (CTES)
    # (in Simple.g)
    def ctes!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )

      type = CTES
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 64:7: '\"' ( NormalChar )* '\"'
      match( 0x22 )
      # at line 64:11: ( NormalChar )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( 0x0, 0x21 ) || look_1_0.between?( 0x23, 0x5b ) || look_1_0.between?( 0x5d, 0xffff ) )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 64:12: NormalChar
          normal_char!

        else
          break # out of loop for decision 1
        end
      end # loop for decision 1
      match( 0x22 )
      # --> action
       print("<CTES> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )

    end

    # lexer rule cteb! (CTEB)
    # (in Simple.g)
    def cteb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )

      type = CTEB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 65:5: ( 'true' | 'false' )
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == 0x74 )
        alt_2 = 1
      elsif ( look_2_0 == 0x66 )
        alt_2 = 2
      else
        raise NoViableAlternative( "", 2, 0 )
      end
      case alt_2
      when 1
        # at line 65:7: 'true'
        match( "true" )

      when 2
        # at line 65:16: 'false'
        match( "false" )
        # --> action
         print("<CTEB> ") 
        # <-- action

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )

    end

    # lexer rule id! (ID)
    # (in Simple.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 66:5: Identifier
      identifier!
      # --> action
       print("<ID> ") 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )

    end

    # lexer rule whitespace! (WHITESPACE)
    # (in Simple.g)
    def whitespace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )

      type = WHITESPACE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 67:13: ( '\\t' | ' ' | '\\r' | '\\n' )+
      # at file 67:13: ( '\\t' | ' ' | '\\r' | '\\n' )+
      match_count_3 = 0
      while true
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0.between?( 0x9, 0xa ) || look_3_0 == 0xd || look_3_0 == 0x20 )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x9, 0xa ) || @input.peek(1) == 0xd || @input.peek(1) == 0x20
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          match_count_3 > 0 and break
          eee = EarlyExit(3)


          raise eee
        end
        match_count_3 += 1
      end

      # --> action
       channel = HIDDEN; 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )

    end

    # lexer rule identifier! (Identifier)
    # (in Simple.g)
    def identifier!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )

      
      # - - - - main rule block - - - -
      # at line 71:7: ( 'a' .. 'z' | 'A' .. 'Z' ) ( 'a' .. 'z' | 'A' .. 'Z' | '_' | '0' .. '9' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 71:28: ( 'a' .. 'z' | 'A' .. 'Z' | '_' | '0' .. '9' )*
      while true # decision 4
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( 0x30, 0x39 ) || look_4_0.between?( 0x41, 0x5a ) || look_4_0 == 0x5f || look_4_0.between?( 0x61, 0x7a ) )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 4
        end
      end # loop for decision 4

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )

    end

    # lexer rule special_char! (SpecialChar)
    # (in Simple.g)
    def special_char!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )

      
      # - - - - main rule block - - - -
      # at line 
      if @input.peek(1) == 0x22 || @input.peek(1) == 0x5c
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )

    end

    # lexer rule normal_char! (NormalChar)
    # (in Simple.g)
    def normal_char!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )

      
      # - - - - main rule block - - - -
      # at line 81:7: ~ SpecialChar
      if @input.peek( 1 ).between?( 0x0, 0x32 ) || @input.peek( 1 ).between?( 0x34, 0xff )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )

    end

    # lexer rule digits! (DIGITS)
    # (in Simple.g)
    def digits!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )

      
      # - - - - main rule block - - - -
      # at line 86:7: ( '0' .. '9' )+
      # at file 86:7: ( '0' .. '9' )+
      match_count_5 = 0
      while true
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0.between?( 0x30, 0x39 ) )
          alt_5 = 1

        end
        case alt_5
        when 1
          # at line 86:8: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_5 > 0 and break
          eee = EarlyExit(5)


          raise eee
        end
        match_count_5 += 1
      end


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( INT | FLOAT | BOOLEAN | STRING | ARRAY | MAIN | VOID | FUNCTION | RETURN | FOR | IF | ELSE | PRINT | INPUT | ASSIGN | LT | LE | GT | GE | EQ | NE | NOT | AND | OR | LBRACK | RBRACK | LPARENT | RPARENT | LSBRACK | RSBRACK | COMMA | REF | SEMICOLON | COLON | PLUS | MINUS | TIMES | DIVIDE | CTEI | CTEF | CTES | CTEB | ID | WHITESPACE )
      alt_6 = 44
      alt_6 = @dfa6.predict( @input )
      case alt_6
      when 1
        # at line 1:10: INT
        int!

      when 2
        # at line 1:14: FLOAT
        float!

      when 3
        # at line 1:20: BOOLEAN
        boolean!

      when 4
        # at line 1:28: STRING
        string!

      when 5
        # at line 1:35: ARRAY
        array!

      when 6
        # at line 1:41: MAIN
        main!

      when 7
        # at line 1:46: VOID
        void!

      when 8
        # at line 1:51: FUNCTION
        function!

      when 9
        # at line 1:60: RETURN
        return!

      when 10
        # at line 1:67: FOR
        for!

      when 11
        # at line 1:71: IF
        if!

      when 12
        # at line 1:74: ELSE
        else!

      when 13
        # at line 1:79: PRINT
        print!

      when 14
        # at line 1:85: INPUT
        input!

      when 15
        # at line 1:91: ASSIGN
        assign!

      when 16
        # at line 1:98: LT
        lt!

      when 17
        # at line 1:101: LE
        le!

      when 18
        # at line 1:104: GT
        gt!

      when 19
        # at line 1:107: GE
        ge!

      when 20
        # at line 1:110: EQ
        eq!

      when 21
        # at line 1:113: NE
        ne!

      when 22
        # at line 1:116: NOT
        not!

      when 23
        # at line 1:120: AND
        and!

      when 24
        # at line 1:124: OR
        or!

      when 25
        # at line 1:127: LBRACK
        lbrack!

      when 26
        # at line 1:134: RBRACK
        rbrack!

      when 27
        # at line 1:141: LPARENT
        lparent!

      when 28
        # at line 1:149: RPARENT
        rparent!

      when 29
        # at line 1:157: LSBRACK
        lsbrack!

      when 30
        # at line 1:165: RSBRACK
        rsbrack!

      when 31
        # at line 1:173: COMMA
        comma!

      when 32
        # at line 1:179: REF
        ref!

      when 33
        # at line 1:183: SEMICOLON
        semicolon!

      when 34
        # at line 1:193: COLON
        colon!

      when 35
        # at line 1:199: PLUS
        plus!

      when 36
        # at line 1:204: MINUS
        minus!

      when 37
        # at line 1:210: TIMES
        times!

      when 38
        # at line 1:216: DIVIDE
        divide!

      when 39
        # at line 1:223: CTEI
        ctei!

      when 40
        # at line 1:228: CTEF
        ctef!

      when 41
        # at line 1:233: CTES
        ctes!

      when 42
        # at line 1:238: CTEB
        cteb!

      when 43
        # at line 1:243: ID
        id!

      when 44
        # at line 1:246: WHITESPACE
        whitespace!

      end
    end

    
    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA6 < ANTLR3::DFA
      EOT = unpack( 1, -1, 10, 34, 1, 52, 1, 54, 1, 56, 1, -1, 2, 34, 14, 
                    -1, 1, 59, 1, -1, 1, 34, 2, -1, 1, 34, 1, 64, 13, 34, 
                    6, -1, 1, 34, 1, 79, 2, -1, 1, 34, 1, 81, 1, 34, 1, 
                    -1, 2, 34, 1, 85, 4, 34, 1, 90, 5, 34, 1, 96, 1, -1, 
                    1, 34, 1, -1, 3, 34, 1, -1, 4, 34, 1, -1, 1, 105, 1, 
                    106, 1, 34, 1, 108, 1, 34, 1, -1, 1, 110, 1, 111, 1, 
                    112, 1, 34, 1, 110, 2, 34, 1, 116, 2, -1, 1, 34, 1, 
                    -1, 1, 118, 3, -1, 2, 34, 1, 121, 1, -1, 1, 122, 1, 
                    -1, 1, 34, 1, 124, 2, -1, 1, 125, 2, -1 )
      EOF = unpack( 126, -1 )
      MIN = unpack( 1, 9, 1, 102, 1, 97, 1, 111, 1, 116, 1, 110, 1, 97, 
                    1, 111, 1, 101, 1, 108, 1, 114, 3, 61, 1, -1, 1, 111, 
                    1, 114, 14, -1, 1, 46, 1, -1, 1, 114, 2, -1, 1, 112, 
                    1, 48, 1, 111, 1, 110, 1, 114, 1, 108, 1, 111, 2, 114, 
                    1, 100, 2, 105, 1, 116, 1, 115, 1, 105, 6, -1, 1, 116, 
                    1, 48, 2, -1, 1, 117, 1, 48, 1, 117, 1, -1, 1, 97, 1, 
                    99, 1, 48, 1, 115, 1, 108, 1, 105, 1, 97, 1, 48, 1, 
                    110, 1, 100, 1, 117, 1, 101, 1, 110, 1, 48, 1, -1, 1, 
                    101, 1, -1, 3, 116, 1, -1, 2, 101, 1, 110, 1, 121, 1, 
                    -1, 2, 48, 1, 114, 1, 48, 1, 116, 1, -1, 3, 48, 1, 105, 
                    1, 48, 1, 97, 1, 103, 1, 48, 2, -1, 1, 110, 1, -1, 1, 
                    48, 3, -1, 1, 111, 1, 110, 1, 48, 1, -1, 1, 48, 1, -1, 
                    1, 110, 1, 48, 2, -1, 1, 48, 2, -1 )
      MAX = unpack( 1, 125, 1, 110, 1, 117, 1, 111, 1, 116, 1, 114, 1, 97, 
                    1, 111, 1, 101, 1, 108, 1, 114, 3, 61, 1, -1, 1, 111, 
                    1, 114, 14, -1, 1, 57, 1, -1, 1, 114, 2, -1, 1, 116, 
                    1, 122, 1, 111, 1, 110, 1, 114, 1, 108, 1, 111, 2, 114, 
                    1, 100, 2, 105, 1, 116, 1, 115, 1, 105, 6, -1, 1, 116, 
                    1, 122, 2, -1, 1, 117, 1, 122, 1, 117, 1, -1, 1, 97, 
                    1, 99, 1, 122, 1, 115, 1, 108, 1, 105, 1, 97, 1, 122, 
                    1, 110, 1, 100, 1, 117, 1, 101, 1, 110, 1, 122, 1, -1, 
                    1, 101, 1, -1, 3, 116, 1, -1, 2, 101, 1, 110, 1, 121, 
                    1, -1, 2, 122, 1, 114, 1, 122, 1, 116, 1, -1, 3, 122, 
                    1, 105, 1, 122, 1, 97, 1, 103, 1, 122, 2, -1, 1, 110, 
                    1, -1, 1, 122, 3, -1, 1, 111, 1, 110, 1, 122, 1, -1, 
                    1, 122, 1, -1, 1, 110, 1, 122, 2, -1, 1, 122, 2, -1 )
      ACCEPT = unpack( 14, -1, 1, 21, 2, -1, 1, 25, 1, 26, 1, 27, 1, 28, 
                       1, 29, 1, 30, 1, 31, 1, 32, 1, 33, 1, 34, 1, 35, 
                       1, 36, 1, 37, 1, 38, 1, -1, 1, 41, 1, -1, 1, 43, 
                       1, 44, 15, -1, 1, 20, 1, 15, 1, 17, 1, 16, 1, 19, 
                       1, 18, 2, -1, 1, 39, 1, 40, 3, -1, 1, 11, 14, -1, 
                       1, 24, 1, -1, 1, 1, 3, -1, 1, 10, 4, -1, 1, 23, 5, 
                       -1, 1, 22, 8, -1, 1, 6, 1, 7, 1, -1, 1, 12, 1, -1, 
                       1, 42, 1, 14, 1, 2, 3, -1, 1, 5, 1, -1, 1, 13, 2, 
                       -1, 1, 4, 1, 9, 1, -1, 1, 3, 1, 8 )
      SPECIAL = unpack( 126, -1 )
      TRANSITION = [
        unpack( 2, 35, 2, -1, 1, 35, 18, -1, 1, 35, 1, 14, 1, 32, 3, -1, 
                1, 24, 1, -1, 1, 19, 1, 20, 1, 29, 1, 27, 1, 23, 1, 28, 
                1, -1, 1, 30, 10, 31, 1, 26, 1, 25, 1, 12, 1, 11, 1, 13, 
                2, -1, 26, 34, 1, 21, 1, -1, 1, 22, 3, -1, 1, 5, 1, 3, 2, 
                34, 1, 9, 1, 2, 2, 34, 1, 1, 3, 34, 1, 6, 1, 15, 1, 16, 
                1, 10, 1, 34, 1, 8, 1, 4, 1, 33, 1, 34, 1, 7, 4, 34, 1, 
                17, 1, -1, 1, 18 ),
        unpack( 1, 37, 7, -1, 1, 36 ),
        unpack( 1, 41, 10, -1, 1, 38, 2, -1, 1, 40, 5, -1, 1, 39 ),
        unpack( 1, 42 ),
        unpack( 1, 43 ),
        unpack( 1, 45, 3, -1, 1, 44 ),
        unpack( 1, 46 ),
        unpack( 1, 47 ),
        unpack( 1, 48 ),
        unpack( 1, 49 ),
        unpack( 1, 50 ),
        unpack( 1, 51 ),
        unpack( 1, 53 ),
        unpack( 1, 55 ),
        unpack(  ),
        unpack( 1, 57 ),
        unpack( 1, 58 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 60, 1, -1, 10, 31 ),
        unpack(  ),
        unpack( 1, 61 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 63, 3, -1, 1, 62 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack( 1, 65 ),
        unpack( 1, 66 ),
        unpack( 1, 67 ),
        unpack( 1, 68 ),
        unpack( 1, 69 ),
        unpack( 1, 70 ),
        unpack( 1, 71 ),
        unpack( 1, 72 ),
        unpack( 1, 73 ),
        unpack( 1, 74 ),
        unpack( 1, 75 ),
        unpack( 1, 76 ),
        unpack( 1, 77 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 78 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 80 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack( 1, 82 ),
        unpack(  ),
        unpack( 1, 83 ),
        unpack( 1, 84 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack( 1, 86 ),
        unpack( 1, 87 ),
        unpack( 1, 88 ),
        unpack( 1, 89 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack( 1, 91 ),
        unpack( 1, 92 ),
        unpack( 1, 93 ),
        unpack( 1, 94 ),
        unpack( 1, 95 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack(  ),
        unpack( 1, 97 ),
        unpack(  ),
        unpack( 1, 98 ),
        unpack( 1, 99 ),
        unpack( 1, 100 ),
        unpack(  ),
        unpack( 1, 101 ),
        unpack( 1, 102 ),
        unpack( 1, 103 ),
        unpack( 1, 104 ),
        unpack(  ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack( 1, 107 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack( 1, 109 ),
        unpack(  ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack( 1, 113 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack( 1, 114 ),
        unpack( 1, 115 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 117 ),
        unpack(  ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 119 ),
        unpack( 1, 120 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack(  ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack(  ),
        unpack( 1, 123 ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 34, 7, -1, 26, 34, 4, -1, 1, 34, 1, -1, 26, 34 ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 6
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( INT | FLOAT | BOOLEAN | STRING | ARRAY | MAIN | VOID | FUNCTION | RETURN | FOR | IF | ELSE | PRINT | INPUT | ASSIGN | LT | LE | GT | GE | EQ | NE | NOT | AND | OR | LBRACK | RBRACK | LPARENT | RPARENT | LSBRACK | RSBRACK | COMMA | REF | SEMICOLON | COLON | PLUS | MINUS | TIMES | DIVIDE | CTEI | CTEF | CTES | CTEB | ID | WHITESPACE );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa6 = DFA6.new( self, 6 )

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end

