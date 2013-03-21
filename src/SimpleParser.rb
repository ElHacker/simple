#!/usr/bin/env ruby
#
# Simple_copy.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Simple_copy.g
# Generated at: 2013-03-21 00:08:43
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

# - - - - - - begin action @parser::header - - - - - -
# Simple_copy.g


  require 'Queue.rb'
  require 'Stack.rb'
  require 'Cuadruples.rb'

# - - - - - - end action @parser::header - - - - - - -


module Simple
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :FUNCTION => 11, :LT => 19, :MAIN => 9, :LBRACK => 28, 
                   :DIGITS => 42, :INPUT => 17, :FOR => 13, :FLOAT => 5, 
                   :NOT => 25, :ID => 49, :NormalChar => 45, :AND => 26, 
                   :EOF => -1, :RSBRACK => 33, :Identifier => 48, :IF => 14, 
                   :BOOLEAN => 6, :COMMA => 34, :SpecialChar => 51, :RETURN => 12, 
                   :PLUS => 38, :VOID => 10, :EQ => 23, :ARRAY => 8, :DIVIDE => 41, 
                   :NE => 24, :RBRACK => 29, :GE => 22, :RPARENT => 31, 
                   :CTES => 46, :CTEF => 44, :ELSE => 15, :CTEI => 43, :WHITESPACE => 50, 
                   :LPARENT => 30, :INT => 4, :SEMICOLON => 36, :CTEB => 47, 
                   :MINUS => 39, :PRINT => 16, :LSBRACK => 32, :REF => 35, 
                   :COLON => 37, :OR => 27, :ASSIGN => 18, :GT => 21, :TIMES => 40, 
                   :LE => 20, :STRING => 7 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "INT", "FLOAT", "BOOLEAN", "STRING", "ARRAY", "MAIN", 
                    "VOID", "FUNCTION", "RETURN", "FOR", "IF", "ELSE", "PRINT", 
                    "INPUT", "ASSIGN", "LT", "LE", "GT", "GE", "EQ", "NE", 
                    "NOT", "AND", "OR", "LBRACK", "RBRACK", "LPARENT", "RPARENT", 
                    "LSBRACK", "RSBRACK", "COMMA", "REF", "SEMICOLON", "COLON", 
                    "PLUS", "MINUS", "TIMES", "DIVIDE", "DIGITS", "CTEI", 
                    "CTEF", "NormalChar", "CTES", "CTEB", "Identifier", 
                    "ID", "WHITESPACE", "SpecialChar" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Simple
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :vars_block, :programa, :var, :variables, :assignint, 
                     :assignfloat, :assignstring, :assignboolean, :tipo, 
                     :func, :funcion, :argumentos, :argumentoaux, :ref, 
                     :retornofunc, :est, :estaux, :estatutos, :idestatutos, 
                     :llamada, :llamadaargs, :llamadaargsaux, :array, :expresion, 
                     :expresionaux, :exp, :expaux, :termino, :terminoaux, 
                     :factor, :notfactor, :sign, :varcte, :idvarcte, :comparacion, 
                     :logico, :retorno, :condicion, :elsecondicion, :escritura, 
                     :argsescritura, :argsescrituraaux, :ciclo, :cicloaux, 
                     :cicloauxx, :lectura, :main, :synpred6_Simple, :synpred7_Simple, 
                     :synpred8_Simple, :synpred9_Simple, :synpred10_Simple, 
                     :synpred11_Simple, :synpred12_Simple, :synpred13_Simple, 
                     :synpred17_Simple, :synpred18_Simple ].freeze

    @@vars_block = Scope( "global", "procedures", "operands_stack", "operations_stack", "jumps_stack", "lines_counter", "cuadruples_array", "scope_location", "sign_variable", "next_temp", "semanthic_cube" )


    include TokenData

    begin
      generated_using( "Simple_copy.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )
      @vars_block_stack = []


    end
    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    VarsBlockReturnValue = define_return_scope 

    # 
    # parser rule vars_block
    # 
    # (in Simple_copy.g)
    # 91:1: vars_block : programa ;
    # 
    def vars_block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )
      @vars_block_stack.push( @@vars_block.new )
      return_value = VarsBlockReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      programa1 = nil

      # - - - - @init action - - - -

        @vars_block_stack.last.global =  Hash.new
        @vars_block_stack.last.procedures =  Hash.new
        @vars_block_stack.last.operands_stack =  Stack.new
        @vars_block_stack.last.operations_stack =  Stack.new
        @vars_block_stack.last.jumps_stack =  Stack.new
        @vars_block_stack.last.lines_counter =  0
        @vars_block_stack.last.cuadruples_array =  []
        @vars_block_stack.last.scope_location =  nil
        @vars_block_stack.last.sign_variable =  nil
        @vars_block_stack.last.next_temp =  1
        @vars_block_stack.last.semanthic_cube = {
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


      begin
        root_0 = @adaptor.create_flat_list


        # at line 233:5: programa
        @state.following.push( TOKENS_FOLLOWING_programa_IN_vars_block_589 )
        programa1 = programa
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, programa1.tree )
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end# syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action

            puts("\n\nFound this global variables: \n")
            @vars_block_stack.last.global.keys.sort.each do | key |
              $var_info = @vars_block_stack.last.global[key]
              print("#{key} : type=#{$var_info[:type]}, value=#{$var_info[:value]}\n")
            end

            puts("\n\nFound this functions: \n")
            @vars_block_stack.last.procedures.keys.sort.each do | key |
              $proc_info = @vars_block_stack.last.procedures[key]
              print("#{key} : #{$proc_info}\n")
            end

            puts("\n\nCuadruples:\n")
            @vars_block_stack.last.cuadruples_array.each do | cuadruple |
              print("op: #{cuadruple[:op]}, oper1: #{cuadruple[:op1]}, oper2: #{cuadruple[:op2]}, dest: #{cuadruple[:dest]}\n")
            end

          # <-- action
        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )
        @vars_block_stack.pop

      end
      
      return return_value
    end

    ProgramaReturnValue = define_return_scope 

    # 
    # parser rule programa
    # 
    # (in Simple_copy.g)
    # 237:1: programa : var func main ;
    # 
    def programa
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      return_value = ProgramaReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      var2 = nil
      func3 = nil
      main4 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 238:5: var func main
        @state.following.push( TOKENS_FOLLOWING_var_IN_programa_604 )
        var2 = var
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, var2.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_func_IN_programa_606 )
        func3 = func
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, func3.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_main_IN_programa_608 )
        main4 = main
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, main4.tree )
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 2 )

      end
      
      return return_value
    end

    VarReturnValue = define_return_scope 

    # 
    # parser rule var
    # 
    # (in Simple_copy.g)
    # 241:1: var : ( | variables var );
    # 
    def var
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      return_value = VarReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      variables5 = nil
      var6 = nil


      begin
        # at line 241:4: ( | variables var )
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == MAIN || look_1_0 == FUNCTION || look_1_0.between?( FOR, IF ) || look_1_0.between?( PRINT, INPUT ) || look_1_0 == ID )
          alt_1 = 1
        elsif ( look_1_0.between?( INT, ARRAY ) )
          alt_1 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 1, 0 )
        end
        case alt_1
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 242:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 242:7: variables var
          @state.following.push( TOKENS_FOLLOWING_variables_IN_var_626 )
          variables5 = variables
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, variables5.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_var_IN_var_628 )
          var6 = var
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, var6.tree )
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 3 )

      end
      
      return return_value
    end

    VariablesReturnValue = define_return_scope 

    # 
    # parser rule variables
    # 
    # (in Simple_copy.g)
    # 245:1: variables : ( INT ID as_int= assignint SEMICOLON | FLOAT ID as_float= assignfloat SEMICOLON | STRING ID as_string= assignstring SEMICOLON | BOOLEAN ID as_boolean= assignboolean SEMICOLON | ARRAY data_type= tipo ID COLON exp SEMICOLON );
    # 
    def variables
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      return_value = VariablesReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __INT7__ = nil
      __ID8__ = nil
      __SEMICOLON9__ = nil
      __FLOAT10__ = nil
      __ID11__ = nil
      __SEMICOLON12__ = nil
      __STRING13__ = nil
      __ID14__ = nil
      __SEMICOLON15__ = nil
      __BOOLEAN16__ = nil
      __ID17__ = nil
      __SEMICOLON18__ = nil
      __ARRAY19__ = nil
      __ID20__ = nil
      __COLON21__ = nil
      __SEMICOLON23__ = nil
      as_int = nil
      as_float = nil
      as_string = nil
      as_boolean = nil
      data_type = nil
      exp22 = nil

      tree_for_INT7 = nil
      tree_for_ID8 = nil
      tree_for_SEMICOLON9 = nil
      tree_for_FLOAT10 = nil
      tree_for_ID11 = nil
      tree_for_SEMICOLON12 = nil
      tree_for_STRING13 = nil
      tree_for_ID14 = nil
      tree_for_SEMICOLON15 = nil
      tree_for_BOOLEAN16 = nil
      tree_for_ID17 = nil
      tree_for_SEMICOLON18 = nil
      tree_for_ARRAY19 = nil
      tree_for_ID20 = nil
      tree_for_COLON21 = nil
      tree_for_SEMICOLON23 = nil

      begin
        # at line 245:10: ( INT ID as_int= assignint SEMICOLON | FLOAT ID as_float= assignfloat SEMICOLON | STRING ID as_string= assignstring SEMICOLON | BOOLEAN ID as_boolean= assignboolean SEMICOLON | ARRAY data_type= tipo ID COLON exp SEMICOLON )
        alt_2 = 5
        case look_2 = @input.peek( 1 )
        when INT then alt_2 = 1
        when FLOAT then alt_2 = 2
        when STRING then alt_2 = 3
        when BOOLEAN then alt_2 = 4
        when ARRAY then alt_2 = 5
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 2, 0 )
        end
        case alt_2
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 246:5: INT ID as_int= assignint SEMICOLON
          __INT7__ = match( INT, TOKENS_FOLLOWING_INT_IN_variables_644 )
          if @state.backtracking == 0

            tree_for_INT7 = @adaptor.create_with_payload( __INT7__ )
            @adaptor.add_child( root_0, tree_for_INT7 )

          end
          __ID8__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_646 )
          if @state.backtracking == 0

            tree_for_ID8 = @adaptor.create_with_payload( __ID8__ )
            @adaptor.add_child( root_0, tree_for_ID8 )

          end
          @state.following.push( TOKENS_FOLLOWING_assignint_IN_variables_650 )
          as_int = assignint
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, as_int.tree )
          end
          __SEMICOLON9__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_652 )
          if @state.backtracking == 0

            tree_for_SEMICOLON9 = @adaptor.create_with_payload( __SEMICOLON9__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON9 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  $var_info = { id: __ID8__.text, type: __INT7__.text, value: ( as_int.nil? ? nil : as_int.value ) }
                  $scope_location = @vars_block_stack.last.scope_location
                  if $scope_location == nil
            	if @vars_block_stack.last.global.has_key?($var_info[:id])
            	  abort("\nERROR: Variable #{$var_info[:id]} already defined in global\n")
            	else
            	  @vars_block_stack.last.global[$var_info[:id]] = $var_info
            	end
                  else
            	if @vars_block_stack.last.procedures[$scope_location][:local_vars].has_key?($var_info[:id])
            	  abort("\nERROR: Variable #{$var_info[:id]} already defined in #{$scope_location}\n")
            	else
            	  @vars_block_stack.last.procedures[$scope_location][:local_vars][$var_info[:id]] = $var_info
            	end
                  end
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 263:7: FLOAT ID as_float= assignfloat SEMICOLON
          __FLOAT10__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_variables_662 )
          if @state.backtracking == 0

            tree_for_FLOAT10 = @adaptor.create_with_payload( __FLOAT10__ )
            @adaptor.add_child( root_0, tree_for_FLOAT10 )

          end
          __ID11__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_664 )
          if @state.backtracking == 0

            tree_for_ID11 = @adaptor.create_with_payload( __ID11__ )
            @adaptor.add_child( root_0, tree_for_ID11 )

          end
          @state.following.push( TOKENS_FOLLOWING_assignfloat_IN_variables_668 )
          as_float = assignfloat
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, as_float.tree )
          end
          __SEMICOLON12__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_670 )
          if @state.backtracking == 0

            tree_for_SEMICOLON12 = @adaptor.create_with_payload( __SEMICOLON12__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON12 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            	$var_info = { id: __ID11__.text, type: __FLOAT10__.text, value: ( as_float.nil? ? nil : as_float.value ) } 
            	$scope_location = @vars_block_stack.last.scope_location
            	if $scope_location == nil
            	    if @vars_block_stack.last.global.has_key?($var_info[:id])
            		abort("\nERROR: Variable #{$var_info[:id]} already defined in global\n")
            	    else
            		@vars_block_stack.last.global[$var_info[:id]] = $var_info
            	    end
            	else
            	    if @vars_block_stack.last.procedures[$scope_location][:local_vars].has_key?($var_info[:id])
            		abort("\nERROR: Variable #{$var_info[:id]} already defined in #{$scope_location}\n")
            	    else
            		@vars_block_stack.last.procedures[$scope_location][:local_vars][$var_info[:id]] = $var_info
            	    end
            	end
                
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 280:7: STRING ID as_string= assignstring SEMICOLON
          __STRING13__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_variables_680 )
          if @state.backtracking == 0

            tree_for_STRING13 = @adaptor.create_with_payload( __STRING13__ )
            @adaptor.add_child( root_0, tree_for_STRING13 )

          end
          __ID14__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_682 )
          if @state.backtracking == 0

            tree_for_ID14 = @adaptor.create_with_payload( __ID14__ )
            @adaptor.add_child( root_0, tree_for_ID14 )

          end
          @state.following.push( TOKENS_FOLLOWING_assignstring_IN_variables_686 )
          as_string = assignstring
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, as_string.tree )
          end
          __SEMICOLON15__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_688 )
          if @state.backtracking == 0

            tree_for_SEMICOLON15 = @adaptor.create_with_payload( __SEMICOLON15__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON15 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            	$var_info = { id: __ID14__.text, type: __STRING13__.text, value: ( as_string.nil? ? nil : as_string.value ) }
            	$scope_location = @vars_block_stack.last.scope_location
            	if $scope_location == nil
            	    if @vars_block_stack.last.global.has_key?($var_info[:id])
            		abort("\nERROR: Variable #{$var_info[:id]} already defined in global\n")
            	    else
            		@vars_block_stack.last.global[$var_info[:id]] = $var_info
            	    end
            	else
            	    if @vars_block_stack.last.procedures[$scope_location][:local_vars].has_key?($var_info[:id])
            		abort("\nERROR: Variable #{$var_info[:id]} already defined in #{$scope_location}\n")
            	    else
            		@vars_block_stack.last.procedures[$scope_location][:local_vars][$var_info[:id]] = $var_info
            	    end
            	end
                
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 297:7: BOOLEAN ID as_boolean= assignboolean SEMICOLON
          __BOOLEAN16__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_variables_698 )
          if @state.backtracking == 0

            tree_for_BOOLEAN16 = @adaptor.create_with_payload( __BOOLEAN16__ )
            @adaptor.add_child( root_0, tree_for_BOOLEAN16 )

          end
          __ID17__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_700 )
          if @state.backtracking == 0

            tree_for_ID17 = @adaptor.create_with_payload( __ID17__ )
            @adaptor.add_child( root_0, tree_for_ID17 )

          end
          @state.following.push( TOKENS_FOLLOWING_assignboolean_IN_variables_704 )
          as_boolean = assignboolean
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, as_boolean.tree )
          end
          __SEMICOLON18__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_706 )
          if @state.backtracking == 0

            tree_for_SEMICOLON18 = @adaptor.create_with_payload( __SEMICOLON18__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON18 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            	$var_info = { id: __ID17__.text, type: __BOOLEAN16__.text, value: ( as_boolean.nil? ? nil : as_boolean.value ) }
            	$scope_location = @vars_block_stack.last.scope_location
            	if $scope_location == nil
            	    if @vars_block_stack.last.global.has_key?($var_info[:id])
            		abort("\nERROR: Variable #{$var_info[:id]} already defined in global\n")
            	    else
            		@vars_block_stack.last.global[$var_info[:id]] = $var_info
            	    end
            	else
            	    if @vars_block_stack.last.procedures[$scope_location][:local_vars].has_key?($var_info[:id])
            		abort("\nERROR: Variable #{$var_info[:id]} already defined in #{$scope_location}\n")
            	    else
            		@vars_block_stack.last.procedures[$scope_location][:local_vars][$var_info[:id]] = $var_info
            	    end
            	end
                
            # <-- action
          end

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 314:7: ARRAY data_type= tipo ID COLON exp SEMICOLON
          __ARRAY19__ = match( ARRAY, TOKENS_FOLLOWING_ARRAY_IN_variables_716 )
          if @state.backtracking == 0

            tree_for_ARRAY19 = @adaptor.create_with_payload( __ARRAY19__ )
            @adaptor.add_child( root_0, tree_for_ARRAY19 )

          end
          @state.following.push( TOKENS_FOLLOWING_tipo_IN_variables_720 )
          data_type = tipo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, data_type.tree )
          end
          __ID20__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_722 )
          if @state.backtracking == 0

            tree_for_ID20 = @adaptor.create_with_payload( __ID20__ )
            @adaptor.add_child( root_0, tree_for_ID20 )

          end
          __COLON21__ = match( COLON, TOKENS_FOLLOWING_COLON_IN_variables_724 )
          if @state.backtracking == 0

            tree_for_COLON21 = @adaptor.create_with_payload( __COLON21__ )
            @adaptor.add_child( root_0, tree_for_COLON21 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_variables_726 )
          exp22 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp22.tree )
          end
          __SEMICOLON23__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_728 )
          if @state.backtracking == 0

            tree_for_SEMICOLON23 = @adaptor.create_with_payload( __SEMICOLON23__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON23 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            	$var_info = { id: __ID20__.text, type: "[#{( data_type.nil? ? nil : data_type.type )}]" }
            	$scope_location = @vars_block_stack.last.scope_location
            	if $scope_location == nil
            	    if @vars_block_stack.last.global.has_key?($var_info[:id])
            		abort("\nERROR: Variable #{$var_info[:id]} already defined in global\n")
            	    else
            		@vars_block_stack.last.global[$var_info[:id]] = $var_info
            	    end
            	else
            	    if @vars_block_stack.last.procedures[$scope_location][:local_vars].has_key?($var_info[:id])
            		abort("\nERROR: Variable #{$var_info[:id]} already defined in #{$scope_location}\n")
            	    else
            		@vars_block_stack.last.procedures[$scope_location][:local_vars][$var_info[:id]] = $var_info
            	    end
            	end
                
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 4 )

      end
      
      return return_value
    end

    AssignintReturnValue = define_return_scope :value

    # 
    # parser rule assignint
    # 
    # (in Simple_copy.g)
    # 333:1: assignint returns [value] : ( | | ASSIGN CTEI );
    # 
    def assignint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = AssignintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN24__ = nil
      __CTEI25__ = nil

      tree_for_ASSIGN24 = nil
      tree_for_CTEI25 = nil

      begin
        # at line 333:25: ( | | ASSIGN CTEI )
        alt_3 = 3
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == SEMICOLON )
          look_3_1 = @input.peek( 2 )

          if ( syntactic_predicate?( :synpred6_Simple ) )
            alt_3 = 1
          elsif ( syntactic_predicate?( :synpred7_Simple ) )
            alt_3 = 2
          else
            @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

            raise NoViableAlternative( "", 3, 1 )
          end
        elsif ( look_3_0 == ASSIGN )
          alt_3 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 3, 0 )
        end
        case alt_3
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 334:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 335:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 335:7: ASSIGN CTEI
          __ASSIGN24__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignint_761 )
          if @state.backtracking == 0

            tree_for_ASSIGN24 = @adaptor.create_with_payload( __ASSIGN24__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN24 )

          end
          __CTEI25__ = match( CTEI, TOKENS_FOLLOWING_CTEI_IN_assignint_763 )
          if @state.backtracking == 0

            tree_for_CTEI25 = @adaptor.create_with_payload( __CTEI25__ )
            @adaptor.add_child( root_0, tree_for_CTEI25 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.value = __CTEI25__.text.to_i 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 5 )

      end
      
      return return_value
    end

    AssignfloatReturnValue = define_return_scope :value

    # 
    # parser rule assignfloat
    # 
    # (in Simple_copy.g)
    # 338:1: assignfloat returns [value] : ( | | ASSIGN CTEF );
    # 
    def assignfloat
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = AssignfloatReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN26__ = nil
      __CTEF27__ = nil

      tree_for_ASSIGN26 = nil
      tree_for_CTEF27 = nil

      begin
        # at line 338:27: ( | | ASSIGN CTEF )
        alt_4 = 3
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == SEMICOLON )
          look_4_1 = @input.peek( 2 )

          if ( syntactic_predicate?( :synpred8_Simple ) )
            alt_4 = 1
          elsif ( syntactic_predicate?( :synpred9_Simple ) )
            alt_4 = 2
          else
            @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

            raise NoViableAlternative( "", 4, 1 )
          end
        elsif ( look_4_0 == ASSIGN )
          alt_4 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 4, 0 )
        end
        case alt_4
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 339:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 340:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 340:7: ASSIGN CTEF
          __ASSIGN26__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignfloat_794 )
          if @state.backtracking == 0

            tree_for_ASSIGN26 = @adaptor.create_with_payload( __ASSIGN26__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN26 )

          end
          __CTEF27__ = match( CTEF, TOKENS_FOLLOWING_CTEF_IN_assignfloat_796 )
          if @state.backtracking == 0

            tree_for_CTEF27 = @adaptor.create_with_payload( __CTEF27__ )
            @adaptor.add_child( root_0, tree_for_CTEF27 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.value = __CTEF27__.text.to_f
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 6 )

      end
      
      return return_value
    end

    AssignstringReturnValue = define_return_scope :value

    # 
    # parser rule assignstring
    # 
    # (in Simple_copy.g)
    # 343:1: assignstring returns [value] : ( | | ASSIGN CTES );
    # 
    def assignstring
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = AssignstringReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN28__ = nil
      __CTES29__ = nil

      tree_for_ASSIGN28 = nil
      tree_for_CTES29 = nil

      begin
        # at line 343:28: ( | | ASSIGN CTES )
        alt_5 = 3
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == SEMICOLON )
          look_5_1 = @input.peek( 2 )

          if ( syntactic_predicate?( :synpred10_Simple ) )
            alt_5 = 1
          elsif ( syntactic_predicate?( :synpred11_Simple ) )
            alt_5 = 2
          else
            @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

            raise NoViableAlternative( "", 5, 1 )
          end
        elsif ( look_5_0 == ASSIGN )
          alt_5 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 5, 0 )
        end
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 344:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 345:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 345:7: ASSIGN CTES
          __ASSIGN28__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignstring_828 )
          if @state.backtracking == 0

            tree_for_ASSIGN28 = @adaptor.create_with_payload( __ASSIGN28__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN28 )

          end
          __CTES29__ = match( CTES, TOKENS_FOLLOWING_CTES_IN_assignstring_830 )
          if @state.backtracking == 0

            tree_for_CTES29 = @adaptor.create_with_payload( __CTES29__ )
            @adaptor.add_child( root_0, tree_for_CTES29 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.value = __CTES29__.text 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 7 )

      end
      
      return return_value
    end

    AssignbooleanReturnValue = define_return_scope :value

    # 
    # parser rule assignboolean
    # 
    # (in Simple_copy.g)
    # 348:1: assignboolean returns [value] : ( | | ASSIGN CTEB );
    # 
    def assignboolean
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = AssignbooleanReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN30__ = nil
      __CTEB31__ = nil

      tree_for_ASSIGN30 = nil
      tree_for_CTEB31 = nil

      begin
        # at line 348:29: ( | | ASSIGN CTEB )
        alt_6 = 3
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == SEMICOLON )
          look_6_1 = @input.peek( 2 )

          if ( syntactic_predicate?( :synpred12_Simple ) )
            alt_6 = 1
          elsif ( syntactic_predicate?( :synpred13_Simple ) )
            alt_6 = 2
          else
            @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

            raise NoViableAlternative( "", 6, 1 )
          end
        elsif ( look_6_0 == ASSIGN )
          alt_6 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 6, 0 )
        end
        case alt_6
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 349:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 350:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 350:7: ASSIGN CTEB
          __ASSIGN30__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignboolean_861 )
          if @state.backtracking == 0

            tree_for_ASSIGN30 = @adaptor.create_with_payload( __ASSIGN30__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN30 )

          end
          __CTEB31__ = match( CTEB, TOKENS_FOLLOWING_CTEB_IN_assignboolean_863 )
          if @state.backtracking == 0

            tree_for_CTEB31 = @adaptor.create_with_payload( __CTEB31__ )
            @adaptor.add_child( root_0, tree_for_CTEB31 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.value = __CTEB31__.text == 'true' 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 8 )

      end
      
      return return_value
    end

    TipoReturnValue = define_return_scope :type

    # 
    # parser rule tipo
    # 
    # (in Simple_copy.g)
    # 353:1: tipo returns [type] : ( INT | FLOAT | STRING | BOOLEAN );
    # 
    def tipo
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = TipoReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __INT32__ = nil
      __FLOAT33__ = nil
      __STRING34__ = nil
      __BOOLEAN35__ = nil

      tree_for_INT32 = nil
      tree_for_FLOAT33 = nil
      tree_for_STRING34 = nil
      tree_for_BOOLEAN35 = nil

      begin
        # at line 353:19: ( INT | FLOAT | STRING | BOOLEAN )
        alt_7 = 4
        case look_7 = @input.peek( 1 )
        when INT then alt_7 = 1
        when FLOAT then alt_7 = 2
        when STRING then alt_7 = 3
        when BOOLEAN then alt_7 = 4
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 7, 0 )
        end
        case alt_7
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 354:5: INT
          __INT32__ = match( INT, TOKENS_FOLLOWING_INT_IN_tipo_886 )
          if @state.backtracking == 0

            tree_for_INT32 = @adaptor.create_with_payload( __INT32__ )
            @adaptor.add_child( root_0, tree_for_INT32 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = __INT32__.text 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 355:7: FLOAT
          __FLOAT33__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_tipo_896 )
          if @state.backtracking == 0

            tree_for_FLOAT33 = @adaptor.create_with_payload( __FLOAT33__ )
            @adaptor.add_child( root_0, tree_for_FLOAT33 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = __FLOAT33__.text 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 356:7: STRING
          __STRING34__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_tipo_906 )
          if @state.backtracking == 0

            tree_for_STRING34 = @adaptor.create_with_payload( __STRING34__ )
            @adaptor.add_child( root_0, tree_for_STRING34 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = __STRING34__.text 
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 357:7: BOOLEAN
          __BOOLEAN35__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_tipo_916 )
          if @state.backtracking == 0

            tree_for_BOOLEAN35 = @adaptor.create_with_payload( __BOOLEAN35__ )
            @adaptor.add_child( root_0, tree_for_BOOLEAN35 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = __BOOLEAN35__.text 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 9 )

      end
      
      return return_value
    end

    FuncReturnValue = define_return_scope 

    # 
    # parser rule func
    # 
    # (in Simple_copy.g)
    # 360:1: func : ( | | funcion func );
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      funcion36 = nil
      func37 = nil


      begin
        # at line 360:5: ( | | funcion func )
        alt_8 = 3
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == MAIN )
          look_8_1 = @input.peek( 2 )

          if ( syntactic_predicate?( :synpred17_Simple ) )
            alt_8 = 1
          elsif ( syntactic_predicate?( :synpred18_Simple ) )
            alt_8 = 2
          else
            @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

            raise NoViableAlternative( "", 8, 1 )
          end
        elsif ( look_8_0 == FUNCTION )
          alt_8 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 8, 0 )
        end
        case alt_8
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 361:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 362:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 362:7: funcion func
          @state.following.push( TOKENS_FOLLOWING_funcion_IN_func_944 )
          funcion36 = funcion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, funcion36.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_func_IN_func_946 )
          func37 = func
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, func37.tree )
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 10 )

      end
      
      return return_value
    end

    FuncionReturnValue = define_return_scope 

    # 
    # parser rule funcion
    # 
    # (in Simple_copy.g)
    # 365:1: funcion : FUNCTION ID LPARENT arguments= argumentos RPARENT COLON return_type= retornofunc LBRACK var est RETURN retorno SEMICOLON RBRACK ;
    # 
    def funcion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = FuncionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FUNCTION38__ = nil
      __ID39__ = nil
      __LPARENT40__ = nil
      __RPARENT41__ = nil
      __COLON42__ = nil
      __LBRACK43__ = nil
      __RETURN46__ = nil
      __SEMICOLON48__ = nil
      __RBRACK49__ = nil
      arguments = nil
      return_type = nil
      var44 = nil
      est45 = nil
      retorno47 = nil

      tree_for_FUNCTION38 = nil
      tree_for_ID39 = nil
      tree_for_LPARENT40 = nil
      tree_for_RPARENT41 = nil
      tree_for_COLON42 = nil
      tree_for_LBRACK43 = nil
      tree_for_RETURN46 = nil
      tree_for_SEMICOLON48 = nil
      tree_for_RBRACK49 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 366:5: FUNCTION ID LPARENT arguments= argumentos RPARENT COLON return_type= retornofunc LBRACK var est RETURN retorno SEMICOLON RBRACK
        __FUNCTION38__ = match( FUNCTION, TOKENS_FOLLOWING_FUNCTION_IN_funcion_964 )
        if @state.backtracking == 0

          tree_for_FUNCTION38 = @adaptor.create_with_payload( __FUNCTION38__ )
          @adaptor.add_child( root_0, tree_for_FUNCTION38 )

        end
        __ID39__ = match( ID, TOKENS_FOLLOWING_ID_IN_funcion_966 )
        if @state.backtracking == 0

          tree_for_ID39 = @adaptor.create_with_payload( __ID39__ )
          @adaptor.add_child( root_0, tree_for_ID39 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           @vars_block_stack.last.scope_location = __ID39__.text 
          # <-- action
        end
        __LPARENT40__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_funcion_970 )
        if @state.backtracking == 0

          tree_for_LPARENT40 = @adaptor.create_with_payload( __LPARENT40__ )
          @adaptor.add_child( root_0, tree_for_LPARENT40 )

        end
        @state.following.push( TOKENS_FOLLOWING_argumentos_IN_funcion_974 )
        arguments = argumentos
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, arguments.tree )
        end
        __RPARENT41__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_funcion_976 )
        if @state.backtracking == 0

          tree_for_RPARENT41 = @adaptor.create_with_payload( __RPARENT41__ )
          @adaptor.add_child( root_0, tree_for_RPARENT41 )

        end
        __COLON42__ = match( COLON, TOKENS_FOLLOWING_COLON_IN_funcion_978 )
        if @state.backtracking == 0

          tree_for_COLON42 = @adaptor.create_with_payload( __COLON42__ )
          @adaptor.add_child( root_0, tree_for_COLON42 )

        end
        @state.following.push( TOKENS_FOLLOWING_retornofunc_IN_funcion_982 )
        return_type = retornofunc
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, return_type.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           
                $ident = @vars_block_stack.last.scope_location
                if not @vars_block_stack.last.procedures.has_key?($ident)
          	@vars_block_stack.last.procedures[$ident] = { id: $ident, args: $arguments, local_vars: Hash.new, return_type: $return_type }
                else
          	abort("\nERROR: Procedure #{$ident} already defined\n")
                end
              
          # <-- action
        end
        __LBRACK43__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_funcion_990 )
        if @state.backtracking == 0

          tree_for_LBRACK43 = @adaptor.create_with_payload( __LBRACK43__ )
          @adaptor.add_child( root_0, tree_for_LBRACK43 )

        end
        @state.following.push( TOKENS_FOLLOWING_var_IN_funcion_992 )
        var44 = var
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, var44.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_est_IN_funcion_994 )
        est45 = est
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, est45.tree )
        end
        __RETURN46__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_funcion_996 )
        if @state.backtracking == 0

          tree_for_RETURN46 = @adaptor.create_with_payload( __RETURN46__ )
          @adaptor.add_child( root_0, tree_for_RETURN46 )

        end
        @state.following.push( TOKENS_FOLLOWING_retorno_IN_funcion_998 )
        retorno47 = retorno
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, retorno47.tree )
        end
        __SEMICOLON48__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_funcion_1000 )
        if @state.backtracking == 0

          tree_for_SEMICOLON48 = @adaptor.create_with_payload( __SEMICOLON48__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON48 )

        end
        __RBRACK49__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_funcion_1002 )
        if @state.backtracking == 0

          tree_for_RBRACK49 = @adaptor.create_with_payload( __RBRACK49__ )
          @adaptor.add_child( root_0, tree_for_RBRACK49 )

        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 11 )

      end
      
      return return_value
    end

    ArgumentosReturnValue = define_return_scope :list

    # 
    # parser rule argumentos
    # 
    # (in Simple_copy.g)
    # 377:1: argumentos returns [list] : ( | data_type= tipo ref ID more_args= argumentoaux );
    # 
    def argumentos
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ArgumentosReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID51__ = nil
      data_type = nil
      more_args = nil
      ref50 = nil

      tree_for_ID51 = nil

      begin
        # at line 377:25: ( | data_type= tipo ref ID more_args= argumentoaux )
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == RPARENT )
          alt_9 = 1
        elsif ( look_9_0.between?( INT, STRING ) )
          alt_9 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 9, 0 )
        end
        case alt_9
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 378:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 378:7: data_type= tipo ref ID more_args= argumentoaux
          @state.following.push( TOKENS_FOLLOWING_tipo_IN_argumentos_1028 )
          data_type = tipo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, data_type.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_ref_IN_argumentos_1030 )
          ref50 = ref
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, ref50.tree )
          end
          __ID51__ = match( ID, TOKENS_FOLLOWING_ID_IN_argumentos_1032 )
          if @state.backtracking == 0

            tree_for_ID51 = @adaptor.create_with_payload( __ID51__ )
            @adaptor.add_child( root_0, tree_for_ID51 )

          end
          @state.following.push( TOKENS_FOLLOWING_argumentoaux_IN_argumentos_1036 )
          more_args = argumentoaux
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, more_args.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                    return_value.list = [ {type: ( data_type.nil? ? nil : data_type.type ), id: __ID51__.text } ]
                    return_value.list.concat(more_args.list) unless more_args.list.nil?
                  
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 12 )

      end
      
      return return_value
    end

    ArgumentoauxReturnValue = define_return_scope :list

    # 
    # parser rule argumentoaux
    # 
    # (in Simple_copy.g)
    # 384:1: argumentoaux returns [list] : ( | COMMA data_type= tipo ref ID more_args= argumentoaux );
    # 
    def argumentoaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = ArgumentoauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA52__ = nil
      __ID54__ = nil
      data_type = nil
      more_args = nil
      ref53 = nil

      tree_for_COMMA52 = nil
      tree_for_ID54 = nil

      begin
        # at line 384:27: ( | COMMA data_type= tipo ref ID more_args= argumentoaux )
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == RPARENT )
          alt_10 = 1
        elsif ( look_10_0 == COMMA )
          alt_10 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 10, 0 )
        end
        case alt_10
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 385:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 385:7: COMMA data_type= tipo ref ID more_args= argumentoaux
          __COMMA52__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argumentoaux_1061 )
          if @state.backtracking == 0

            tree_for_COMMA52 = @adaptor.create_with_payload( __COMMA52__ )
            @adaptor.add_child( root_0, tree_for_COMMA52 )

          end
          @state.following.push( TOKENS_FOLLOWING_tipo_IN_argumentoaux_1065 )
          data_type = tipo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, data_type.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_ref_IN_argumentoaux_1067 )
          ref53 = ref
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, ref53.tree )
          end
          __ID54__ = match( ID, TOKENS_FOLLOWING_ID_IN_argumentoaux_1069 )
          if @state.backtracking == 0

            tree_for_ID54 = @adaptor.create_with_payload( __ID54__ )
            @adaptor.add_child( root_0, tree_for_ID54 )

          end
          @state.following.push( TOKENS_FOLLOWING_argumentoaux_IN_argumentoaux_1073 )
          more_args = argumentoaux
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, more_args.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
                    return_value.list = [ {type: ( data_type.nil? ? nil : data_type.type ), id: __ID54__.text } ]
                    return_value.list.concat(more_args.list) unless more_args.list.nil?
                  
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 13 )

      end
      
      return return_value
    end

    RefReturnValue = define_return_scope 

    # 
    # parser rule ref
    # 
    # (in Simple_copy.g)
    # 391:1: ref : ( | REF );
    # 
    def ref
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = RefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __REF55__ = nil

      tree_for_REF55 = nil

      begin
        # at line 391:4: ( | REF )
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == ID )
          alt_11 = 1
        elsif ( look_11_0 == REF )
          alt_11 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 11, 0 )
        end
        case alt_11
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 392:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 392:7: REF
          __REF55__ = match( REF, TOKENS_FOLLOWING_REF_IN_ref_1095 )
          if @state.backtracking == 0

            tree_for_REF55 = @adaptor.create_with_payload( __REF55__ )
            @adaptor.add_child( root_0, tree_for_REF55 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[REF] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 14 )

      end
      
      return return_value
    end

    RetornofuncReturnValue = define_return_scope :type

    # 
    # parser rule retornofunc
    # 
    # (in Simple_copy.g)
    # 395:1: retornofunc returns [type] : ( VOID | data_type= tipo );
    # 
    def retornofunc
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = RetornofuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __VOID56__ = nil
      data_type = nil

      tree_for_VOID56 = nil

      begin
        # at line 395:26: ( VOID | data_type= tipo )
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == VOID )
          alt_12 = 1
        elsif ( look_12_0.between?( INT, STRING ) )
          alt_12 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 12, 0 )
        end
        case alt_12
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 396:5: VOID
          __VOID56__ = match( VOID, TOKENS_FOLLOWING_VOID_IN_retornofunc_1116 )
          if @state.backtracking == 0

            tree_for_VOID56 = @adaptor.create_with_payload( __VOID56__ )
            @adaptor.add_child( root_0, tree_for_VOID56 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type=__VOID56__.text 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 397:7: data_type= tipo
          @state.following.push( TOKENS_FOLLOWING_tipo_IN_retornofunc_1128 )
          data_type = tipo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, data_type.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type=( data_type.nil? ? nil : data_type.type ) 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 15 )

      end
      
      return return_value
    end

    EstReturnValue = define_return_scope 

    # 
    # parser rule est
    # 
    # (in Simple_copy.g)
    # 400:1: est : estatutos estaux ;
    # 
    def est
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = EstReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      estatutos57 = nil
      estaux58 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 401:5: estatutos estaux
        @state.following.push( TOKENS_FOLLOWING_estatutos_IN_est_1146 )
        estatutos57 = estatutos
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, estatutos57.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_estaux_IN_est_1148 )
        estaux58 = estaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, estaux58.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           print("[EST] ") 
          # <-- action
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 16 )

      end
      
      return return_value
    end

    EstauxReturnValue = define_return_scope 

    # 
    # parser rule estaux
    # 
    # (in Simple_copy.g)
    # 404:1: estaux : ( | estatutos estaux );
    # 
    def estaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = EstauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      estatutos59 = nil
      estaux60 = nil


      begin
        # at line 404:7: ( | estatutos estaux )
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == RETURN || look_13_0 == RBRACK )
          alt_13 = 1
        elsif ( look_13_0.between?( FOR, IF ) || look_13_0.between?( PRINT, INPUT ) || look_13_0 == ID )
          alt_13 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 13, 0 )
        end
        case alt_13
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 405:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 405:7: estatutos estaux
          @state.following.push( TOKENS_FOLLOWING_estatutos_IN_estaux_1170 )
          estatutos59 = estatutos
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, estatutos59.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_estaux_IN_estaux_1172 )
          estaux60 = estaux
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, estaux60.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[ESTAUX] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    EstatutosReturnValue = define_return_scope 

    # 
    # parser rule estatutos
    # 
    # (in Simple_copy.g)
    # 408:1: estatutos : ( ID idestatutos SEMICOLON | condicion | escritura | ciclo | lectura );
    # 
    def estatutos
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = EstatutosReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID61__ = nil
      __SEMICOLON63__ = nil
      idestatutos62 = nil
      condicion64 = nil
      escritura65 = nil
      ciclo66 = nil
      lectura67 = nil

      tree_for_ID61 = nil
      tree_for_SEMICOLON63 = nil

      begin
        # at line 408:10: ( ID idestatutos SEMICOLON | condicion | escritura | ciclo | lectura )
        alt_14 = 5
        case look_14 = @input.peek( 1 )
        when ID then alt_14 = 1
        when IF then alt_14 = 2
        when PRINT then alt_14 = 3
        when FOR then alt_14 = 4
        when INPUT then alt_14 = 5
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 14, 0 )
        end
        case alt_14
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 409:5: ID idestatutos SEMICOLON
          __ID61__ = match( ID, TOKENS_FOLLOWING_ID_IN_estatutos_1190 )
          if @state.backtracking == 0

            tree_for_ID61 = @adaptor.create_with_payload( __ID61__ )
            @adaptor.add_child( root_0, tree_for_ID61 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
                  $id = __ID61__.text
                  $scope_location = @vars_block_stack.last.scope_location
                  if not $scope_location.nil?
            	if @vars_block_stack.last.procedures[$scope_location][:local_vars].has_key?($id)
            	  @vars_block_stack.last.operands_stack.push( @vars_block_stack.last.procedures[$scope_location][:local_vars][$id] )
            	elsif @vars_block_stack.last.global.has_key?($id)
            	  @vars_block_stack.last.operands_stack.push( @vars_block_stack.last.global[$id] )
            	else
            	  abort("\nERROR: Variable #{$id} not defined in the program\n")
            	end
                  else
            	if @vars_block_stack.last.global.has_key?($id)
            	  @vars_block_stack.last.operands_stack.push( @vars_block_stack.last.global[$id] )
            	else
            	  abort("\nERROR: Variable #{$id} not defined in the program\n")
            	end
                  end
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_idestatutos_IN_estatutos_1198 )
          idestatutos62 = idestatutos
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, idestatutos62.tree )
          end
          __SEMICOLON63__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_estatutos_1200 )
          if @state.backtracking == 0

            tree_for_SEMICOLON63 = @adaptor.create_with_payload( __SEMICOLON63__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON63 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
                  $next_operation = @vars_block_stack.last.operations_stack.look()
                  @vars_block_stack.last.operations_stack.pop()
                  $oper1 = @vars_block_stack.last.operands_stack.look()
                  @vars_block_stack.last.operands_stack.pop()
                  $oper2 = @vars_block_stack.last.operands_stack.look()
                  @vars_block_stack.last.operands_stack.pop()
                  if $oper1[:type] != @vars_block_stack.last.semanthic_cube[$oper1[:type]][$oper2[:type]][$next_operation]
            	print("\nWARNING: #{@vars_block_stack.last.semanthic_cube[$oper1[:type]][$oper2[:type]][$next_operation]} to #{$oper1[:type]}\n")
                  end
                  $cuadruple = { op: $next_operation, op1: $oper1, op2: nil, dest: $oper2}
                  @vars_block_stack.last.lines_counter = @vars_block_stack.last.lines_counter + 1
                  @vars_block_stack.last.cuadruples_array << $cuadruple 
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 442:7: condicion
          @state.following.push( TOKENS_FOLLOWING_condicion_IN_estatutos_1210 )
          condicion64 = condicion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, condicion64.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[ESTATUTOS] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 443:7: escritura
          @state.following.push( TOKENS_FOLLOWING_escritura_IN_estatutos_1220 )
          escritura65 = escritura
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, escritura65.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[ESTATUTOS] ") 
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 444:7: ciclo
          @state.following.push( TOKENS_FOLLOWING_ciclo_IN_estatutos_1230 )
          ciclo66 = ciclo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, ciclo66.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[ESTATUTOS] ") 
            # <-- action
          end

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 445:7: lectura
          @state.following.push( TOKENS_FOLLOWING_lectura_IN_estatutos_1240 )
          lectura67 = lectura
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, lectura67.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[ESTATUTOS] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 18 )

      end
      
      return return_value
    end

    IdestatutosReturnValue = define_return_scope 

    # 
    # parser rule idestatutos
    # 
    # (in Simple_copy.g)
    # 448:1: idestatutos : ( llamada | array ASSIGN expresion | ASSIGN expresion );
    # 
    def idestatutos
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = IdestatutosReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN70__ = nil
      __ASSIGN72__ = nil
      llamada68 = nil
      array69 = nil
      expresion71 = nil
      expresion73 = nil

      tree_for_ASSIGN70 = nil
      tree_for_ASSIGN72 = nil

      begin
        # at line 448:12: ( llamada | array ASSIGN expresion | ASSIGN expresion )
        alt_15 = 3
        case look_15 = @input.peek( 1 )
        when LPARENT then alt_15 = 1
        when LSBRACK then alt_15 = 2
        when ASSIGN then alt_15 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 15, 0 )
        end
        case alt_15
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 449:5: llamada
          @state.following.push( TOKENS_FOLLOWING_llamada_IN_idestatutos_1258 )
          llamada68 = llamada
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, llamada68.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[IDESTATUTOS] ") 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 450:7: array ASSIGN expresion
          @state.following.push( TOKENS_FOLLOWING_array_IN_idestatutos_1268 )
          array69 = array
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, array69.tree )
          end
          __ASSIGN70__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_idestatutos_1270 )
          if @state.backtracking == 0

            tree_for_ASSIGN70 = @adaptor.create_with_payload( __ASSIGN70__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN70 )

          end
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_idestatutos_1272 )
          expresion71 = expresion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expresion71.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[IDESTATUTOS] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 451:7: ASSIGN expresion
          __ASSIGN72__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_idestatutos_1282 )
          if @state.backtracking == 0

            tree_for_ASSIGN72 = @adaptor.create_with_payload( __ASSIGN72__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN72 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.operations_stack.push( __ASSIGN72__.text )
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_idestatutos_1290 )
          expresion73 = expresion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expresion73.tree )
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    LlamadaReturnValue = define_return_scope 

    # 
    # parser rule llamada
    # 
    # (in Simple_copy.g)
    # 457:1: llamada : LPARENT llamadaargs RPARENT ;
    # 
    def llamada
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = LlamadaReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __LPARENT74__ = nil
      __RPARENT76__ = nil
      llamadaargs75 = nil

      tree_for_LPARENT74 = nil
      tree_for_RPARENT76 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 458:5: LPARENT llamadaargs RPARENT
        __LPARENT74__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_llamada_1307 )
        if @state.backtracking == 0

          tree_for_LPARENT74 = @adaptor.create_with_payload( __LPARENT74__ )
          @adaptor.add_child( root_0, tree_for_LPARENT74 )

        end
        @state.following.push( TOKENS_FOLLOWING_llamadaargs_IN_llamada_1309 )
        llamadaargs75 = llamadaargs
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, llamadaargs75.tree )
        end
        __RPARENT76__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_llamada_1311 )
        if @state.backtracking == 0

          tree_for_RPARENT76 = @adaptor.create_with_payload( __RPARENT76__ )
          @adaptor.add_child( root_0, tree_for_RPARENT76 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           print("[LLAMADA] ") 
          # <-- action
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 20 )

      end
      
      return return_value
    end

    LlamadaargsReturnValue = define_return_scope 

    # 
    # parser rule llamadaargs
    # 
    # (in Simple_copy.g)
    # 461:1: llamadaargs : ( | exp llamadaargsaux );
    # 
    def llamadaargs
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = LlamadaargsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      exp77 = nil
      llamadaargsaux78 = nil


      begin
        # at line 461:12: ( | exp llamadaargsaux )
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == RPARENT )
          alt_16 = 1
        elsif ( look_16_0 == NOT || look_16_0 == LPARENT || look_16_0.between?( CTEI, CTEF ) || look_16_0.between?( CTES, CTEB ) || look_16_0 == ID )
          alt_16 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 16, 0 )
        end
        case alt_16
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 462:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 462:7: exp llamadaargsaux
          @state.following.push( TOKENS_FOLLOWING_exp_IN_llamadaargs_1333 )
          exp77 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp77.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_llamadaargsaux_IN_llamadaargs_1335 )
          llamadaargsaux78 = llamadaargsaux
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, llamadaargsaux78.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[LLAMADAARGS] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    LlamadaargsauxReturnValue = define_return_scope 

    # 
    # parser rule llamadaargsaux
    # 
    # (in Simple_copy.g)
    # 465:1: llamadaargsaux : ( | COMMA exp llamadaargsaux );
    # 
    def llamadaargsaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = LlamadaargsauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA79__ = nil
      exp80 = nil
      llamadaargsaux81 = nil

      tree_for_COMMA79 = nil

      begin
        # at line 465:15: ( | COMMA exp llamadaargsaux )
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == RPARENT )
          alt_17 = 1
        elsif ( look_17_0 == COMMA )
          alt_17 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 17, 0 )
        end
        case alt_17
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 466:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 466:7: COMMA exp llamadaargsaux
          __COMMA79__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_llamadaargsaux_1357 )
          if @state.backtracking == 0

            tree_for_COMMA79 = @adaptor.create_with_payload( __COMMA79__ )
            @adaptor.add_child( root_0, tree_for_COMMA79 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_llamadaargsaux_1359 )
          exp80 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp80.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_llamadaargsaux_IN_llamadaargsaux_1361 )
          llamadaargsaux81 = llamadaargsaux
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, llamadaargsaux81.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[LLAMADAARGSAUX] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    ArrayReturnValue = define_return_scope 

    # 
    # parser rule array
    # 
    # (in Simple_copy.g)
    # 469:1: array : LSBRACK exp RSBRACK ;
    # 
    def array
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ArrayReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __LSBRACK82__ = nil
      __RSBRACK84__ = nil
      exp83 = nil

      tree_for_LSBRACK82 = nil
      tree_for_RSBRACK84 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 470:5: LSBRACK exp RSBRACK
        __LSBRACK82__ = match( LSBRACK, TOKENS_FOLLOWING_LSBRACK_IN_array_1379 )
        if @state.backtracking == 0

          tree_for_LSBRACK82 = @adaptor.create_with_payload( __LSBRACK82__ )
          @adaptor.add_child( root_0, tree_for_LSBRACK82 )

        end
        @state.following.push( TOKENS_FOLLOWING_exp_IN_array_1381 )
        exp83 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp83.tree )
        end
        __RSBRACK84__ = match( RSBRACK, TOKENS_FOLLOWING_RSBRACK_IN_array_1383 )
        if @state.backtracking == 0

          tree_for_RSBRACK84 = @adaptor.create_with_payload( __RSBRACK84__ )
          @adaptor.add_child( root_0, tree_for_RSBRACK84 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           print("[ARRAY] ") 
          # <-- action
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    ExpresionReturnValue = define_return_scope 

    # 
    # parser rule expresion
    # 
    # (in Simple_copy.g)
    # 473:1: expresion : exp ;
    # 
    def expresion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = ExpresionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      exp85 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 474:5: exp
        @state.following.push( TOKENS_FOLLOWING_exp_IN_expresion_1401 )
        exp85 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp85.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           print("[EXPRESION] ") 
          # <-- action
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 24 )

      end
      
      return return_value
    end

    ExpresionauxReturnValue = define_return_scope 

    # 
    # parser rule expresionaux
    # 
    # (in Simple_copy.g)
    # 478:1: expresionaux : ( | comparacion expresion | logico expresion );
    # 
    def expresionaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ExpresionauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      comparacion86 = nil
      expresion87 = nil
      logico88 = nil
      expresion89 = nil


      begin
        # at line 478:13: ( | comparacion expresion | logico expresion )
        alt_18 = 3
        case look_18 = @input.peek( 1 )
        when EOF then alt_18 = 1
        when LT, LE, GT, GE, EQ, NE then alt_18 = 2
        when AND, OR then alt_18 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 18, 0 )
        end
        case alt_18
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 479:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 479:7: comparacion expresion
          @state.following.push( TOKENS_FOLLOWING_comparacion_IN_expresionaux_1427 )
          comparacion86 = comparacion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, comparacion86.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_expresionaux_1429 )
          expresion87 = expresion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expresion87.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[EXPRESIONAX] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 480:7: logico expresion
          @state.following.push( TOKENS_FOLLOWING_logico_IN_expresionaux_1440 )
          logico88 = logico
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, logico88.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_expresionaux_1442 )
          expresion89 = expresion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expresion89.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[EXPRESIONAX] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    ExpReturnValue = define_return_scope 

    # 
    # parser rule exp
    # 
    # (in Simple_copy.g)
    # 483:1: exp : termino expaux ;
    # 
    def exp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ExpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      termino90 = nil
      expaux91 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 484:5: termino expaux
        @state.following.push( TOKENS_FOLLOWING_termino_IN_exp_1460 )
        termino90 = termino
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, termino90.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action

                $next_operation = @vars_block_stack.last.operations_stack.look()
                if (not $next_operation.nil?) && ($next_operation == '+' || $next_operation == '-')
          	@vars_block_stack.last.operations_stack.pop()
          	$oper2 = @vars_block_stack.last.operands_stack.look()
          	@vars_block_stack.last.operands_stack.pop()
          	$oper1 = @vars_block_stack.last.operands_stack.look()
          	@vars_block_stack.last.operands_stack.pop()
          	if (not @vars_block_stack.last.semanthic_cube[$oper1[:type]][$oper2[:type]].nil?) && 
          	    (not @vars_block_stack.last.semanthic_cube[$oper1[:type]][$oper2[:type]][$next_operation].nil?)
          	  $resulting_type = @vars_block_stack.last.semanthic_cube[$oper1[:type]][$oper2[:type]][$next_operation]
          	  $temp = 't' + @vars_block_stack.last.next_temp.to_s
          	  @vars_block_stack.last.next_temp = @vars_block_stack.last.next_temp + 1
          	  $destiny = { id: $temp, type: $resulting_type, value: nil }
          	  $cuadruple = { op: $next_operation, op1: $oper1, op2: $oper2, dest: $destiny }
          	  @vars_block_stack.last.lines_counter = @vars_block_stack.last.lines_counter + 1
          	  @vars_block_stack.last.cuadruples_array << $cuadruple
          	  @vars_block_stack.last.operands_stack.push( $destiny )
          	else
          	  abort("\nERROR: #{$oper1[:type]} #{$next_operation} #{$oper2[:type]} is invalid\n")
          	end
                end
              
          # <-- action
        end
        @state.following.push( TOKENS_FOLLOWING_expaux_IN_exp_1474 )
        expaux91 = expaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expaux91.tree )
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 26 )

      end
      
      return return_value
    end

    ExpauxReturnValue = define_return_scope 

    # 
    # parser rule expaux
    # 
    # (in Simple_copy.g)
    # 510:1: expaux : ( | PLUS exp | MINUS exp );
    # 
    def expaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ExpauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS92__ = nil
      __MINUS94__ = nil
      exp93 = nil
      exp95 = nil

      tree_for_PLUS92 = nil
      tree_for_MINUS94 = nil

      begin
        # at line 510:7: ( | PLUS exp | MINUS exp )
        alt_19 = 3
        case look_19 = @input.peek( 1 )
        when EOF, RPARENT, RSBRACK, COMMA, SEMICOLON then alt_19 = 1
        when PLUS then alt_19 = 2
        when MINUS then alt_19 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 19, 0 )
        end
        case alt_19
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 511:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 511:7: PLUS exp
          __PLUS92__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expaux_1494 )
          if @state.backtracking == 0

            tree_for_PLUS92 = @adaptor.create_with_payload( __PLUS92__ )
            @adaptor.add_child( root_0, tree_for_PLUS92 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.operations_stack.push( __PLUS92__.text )
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_expaux_1502 )
          exp93 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp93.tree )
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 515:7: MINUS exp
          __MINUS94__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expaux_1511 )
          if @state.backtracking == 0

            tree_for_MINUS94 = @adaptor.create_with_payload( __MINUS94__ )
            @adaptor.add_child( root_0, tree_for_MINUS94 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.operations_stack.push( __MINUS94__.text )
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_expaux_1519 )
          exp95 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp95.tree )
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    TerminoReturnValue = define_return_scope 

    # 
    # parser rule termino
    # 
    # (in Simple_copy.g)
    # 521:1: termino : factor terminoaux ;
    # 
    def termino
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = TerminoReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      factor96 = nil
      terminoaux97 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 522:5: factor terminoaux
        @state.following.push( TOKENS_FOLLOWING_factor_IN_termino_1536 )
        factor96 = factor
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, factor96.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           
                $next_operation = @vars_block_stack.last.operations_stack.look()
                if (not $next_operation.nil?) && ($next_operation == '*' || $next_operation == '/')
          	@vars_block_stack.last.operations_stack.pop()
          	$oper2 = @vars_block_stack.last.operands_stack.look()
          	@vars_block_stack.last.operands_stack.pop()
          	$oper1 = @vars_block_stack.last.operands_stack.look()
          	@vars_block_stack.last.operands_stack.pop()
          	if (not @vars_block_stack.last.semanthic_cube[$oper1[:type]][$oper2[:type]].nil?) &&
          	    (not @vars_block_stack.last.semanthic_cube[$oper1[:type]][$oper2[:type]][$next_operation].nil?)
          	  $resulting_type = @vars_block_stack.last.semanthic_cube[$oper1[:type]][$oper2[:type]][$next_operation]
          	  $temp = 't' + @vars_block_stack.last.next_temp.to_s
          	  @vars_block_stack.last.next_temp = @vars_block_stack.last.next_temp + 1
          	  $destiny = { id: $temp, type: $resulting_type, value: nil }
          	  $cuadruple = { op: $next_operation, op1: $oper1, op2: $oper2, dest: $destiny }
          	  @vars_block_stack.last.lines_counter = @vars_block_stack.last.lines_counter + 1
          	  @vars_block_stack.last.cuadruples_array << $cuadruple
          	  @vars_block_stack.last.operands_stack.push( $destiny )
          	else
          	  abort("\nERROR: #{$oper1[:type]} #{$next_operation} #{$oper2[:type]} is invalid\n")
          	end
                end
              
          # <-- action
        end
        @state.following.push( TOKENS_FOLLOWING_terminoaux_IN_termino_1545 )
        terminoaux97 = terminoaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, terminoaux97.tree )
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    TerminoauxReturnValue = define_return_scope 

    # 
    # parser rule terminoaux
    # 
    # (in Simple_copy.g)
    # 548:1: terminoaux : ( | TIMES termino | DIVIDE termino );
    # 
    def terminoaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = TerminoauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TIMES98__ = nil
      __DIVIDE100__ = nil
      termino99 = nil
      termino101 = nil

      tree_for_TIMES98 = nil
      tree_for_DIVIDE100 = nil

      begin
        # at line 548:11: ( | TIMES termino | DIVIDE termino )
        alt_20 = 3
        case look_20 = @input.peek( 1 )
        when EOF, RPARENT, RSBRACK, COMMA, SEMICOLON, PLUS, MINUS then alt_20 = 1
        when TIMES then alt_20 = 2
        when DIVIDE then alt_20 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 20, 0 )
        end
        case alt_20
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 549:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 549:7: TIMES termino
          __TIMES98__ = match( TIMES, TOKENS_FOLLOWING_TIMES_IN_terminoaux_1565 )
          if @state.backtracking == 0

            tree_for_TIMES98 = @adaptor.create_with_payload( __TIMES98__ )
            @adaptor.add_child( root_0, tree_for_TIMES98 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.operations_stack.push( __TIMES98__.text )
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_termino_IN_terminoaux_1574 )
          termino99 = termino
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, termino99.tree )
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 553:7: DIVIDE termino
          __DIVIDE100__ = match( DIVIDE, TOKENS_FOLLOWING_DIVIDE_IN_terminoaux_1583 )
          if @state.backtracking == 0

            tree_for_DIVIDE100 = @adaptor.create_with_payload( __DIVIDE100__ )
            @adaptor.add_child( root_0, tree_for_DIVIDE100 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.operations_stack.push( __DIVIDE100__.text )
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_termino_IN_terminoaux_1591 )
          termino101 = termino
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, termino101.tree )
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 29 )

      end
      
      return return_value
    end

    FactorReturnValue = define_return_scope 

    # 
    # parser rule factor
    # 
    # (in Simple_copy.g)
    # 560:1: factor : ( NOT notfactor | LPARENT exp RPARENT | varcte );
    # 
    def factor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = FactorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT102__ = nil
      __LPARENT104__ = nil
      __RPARENT106__ = nil
      notfactor103 = nil
      exp105 = nil
      varcte107 = nil

      tree_for_NOT102 = nil
      tree_for_LPARENT104 = nil
      tree_for_RPARENT106 = nil

      begin
        # at line 560:7: ( NOT notfactor | LPARENT exp RPARENT | varcte )
        alt_21 = 3
        case look_21 = @input.peek( 1 )
        when NOT then alt_21 = 1
        when LPARENT then alt_21 = 2
        when CTEI, CTEF, CTES, CTEB, ID then alt_21 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 21, 0 )
        end
        case alt_21
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 561:5: NOT notfactor
          __NOT102__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_factor_1610 )
          if @state.backtracking == 0

            tree_for_NOT102 = @adaptor.create_with_payload( __NOT102__ )
            @adaptor.add_child( root_0, tree_for_NOT102 )

          end
          @state.following.push( TOKENS_FOLLOWING_notfactor_IN_factor_1612 )
          notfactor103 = notfactor
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, notfactor103.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[FACTOR] ") 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 562:7: LPARENT exp RPARENT
          __LPARENT104__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_factor_1622 )
          if @state.backtracking == 0

            tree_for_LPARENT104 = @adaptor.create_with_payload( __LPARENT104__ )
            @adaptor.add_child( root_0, tree_for_LPARENT104 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.operations_stack.push( __LPARENT104__.text )
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_factor_1626 )
          exp105 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp105.tree )
          end
          __RPARENT106__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_factor_1628 )
          if @state.backtracking == 0

            tree_for_RPARENT106 = @adaptor.create_with_payload( __RPARENT106__ )
            @adaptor.add_child( root_0, tree_for_RPARENT106 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.operations_stack.pop()
                
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 568:7: varcte
          @state.following.push( TOKENS_FOLLOWING_varcte_IN_factor_1644 )
          varcte107 = varcte
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, varcte107.tree )
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    NotfactorReturnValue = define_return_scope 

    # 
    # parser rule notfactor
    # 
    # (in Simple_copy.g)
    # 571:1: notfactor : ( LPARENT exp RPARENT | varcte );
    # 
    def notfactor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = NotfactorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __LPARENT108__ = nil
      __RPARENT110__ = nil
      exp109 = nil
      varcte111 = nil

      tree_for_LPARENT108 = nil
      tree_for_RPARENT110 = nil

      begin
        # at line 571:10: ( LPARENT exp RPARENT | varcte )
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == LPARENT )
          alt_22 = 1
        elsif ( look_22_0.between?( CTEI, CTEF ) || look_22_0.between?( CTES, CTEB ) || look_22_0 == ID )
          alt_22 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 22, 0 )
        end
        case alt_22
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 572:5: LPARENT exp RPARENT
          __LPARENT108__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_notfactor_1660 )
          if @state.backtracking == 0

            tree_for_LPARENT108 = @adaptor.create_with_payload( __LPARENT108__ )
            @adaptor.add_child( root_0, tree_for_LPARENT108 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_notfactor_1662 )
          exp109 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp109.tree )
          end
          __RPARENT110__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_notfactor_1664 )
          if @state.backtracking == 0

            tree_for_RPARENT110 = @adaptor.create_with_payload( __RPARENT110__ )
            @adaptor.add_child( root_0, tree_for_RPARENT110 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[NOTFACTOR] ") 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 573:7: varcte
          @state.following.push( TOKENS_FOLLOWING_varcte_IN_notfactor_1674 )
          varcte111 = varcte
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, varcte111.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[NOTFACTOR] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 31 )

      end
      
      return return_value
    end

    SignReturnValue = define_return_scope 

    # 
    # parser rule sign
    # 
    # (in Simple_copy.g)
    # 576:1: sign : ( PLUS | MINUS );
    # 
    def sign
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = SignReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS112__ = nil
      __MINUS113__ = nil

      tree_for_PLUS112 = nil
      tree_for_MINUS113 = nil

      begin
        # at line 576:5: ( PLUS | MINUS )
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == PLUS )
          alt_23 = 1
        elsif ( look_23_0 == MINUS )
          alt_23 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 23, 0 )
        end
        case alt_23
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 577:5: PLUS
          __PLUS112__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_sign_1692 )
          if @state.backtracking == 0

            tree_for_PLUS112 = @adaptor.create_with_payload( __PLUS112__ )
            @adaptor.add_child( root_0, tree_for_PLUS112 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

            	@vars_block_stack.last.sign_variable = __PLUS112__.text
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 580:7: MINUS
          __MINUS113__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_sign_1702 )
          if @state.backtracking == 0

            tree_for_MINUS113 = @adaptor.create_with_payload( __MINUS113__ )
            @adaptor.add_child( root_0, tree_for_MINUS113 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

            	@vars_block_stack.last.sign_variable = __MINUS113__.text
                
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 32 )

      end
      
      return return_value
    end

    VarcteReturnValue = define_return_scope 

    # 
    # parser rule varcte
    # 
    # (in Simple_copy.g)
    # 585:1: varcte : ( ID idvarcte | CTEI | CTEF | CTES | CTEB );
    # 
    def varcte
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = VarcteReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID114__ = nil
      __CTEI116__ = nil
      __CTEF117__ = nil
      __CTES118__ = nil
      __CTEB119__ = nil
      idvarcte115 = nil

      tree_for_ID114 = nil
      tree_for_CTEI116 = nil
      tree_for_CTEF117 = nil
      tree_for_CTES118 = nil
      tree_for_CTEB119 = nil

      begin
        # at line 585:7: ( ID idvarcte | CTEI | CTEF | CTES | CTEB )
        alt_24 = 5
        case look_24 = @input.peek( 1 )
        when ID then alt_24 = 1
        when CTEI then alt_24 = 2
        when CTEF then alt_24 = 3
        when CTES then alt_24 = 4
        when CTEB then alt_24 = 5
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 24, 0 )
        end
        case alt_24
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 586:5: ID idvarcte
          __ID114__ = match( ID, TOKENS_FOLLOWING_ID_IN_varcte_1720 )
          if @state.backtracking == 0

            tree_for_ID114 = @adaptor.create_with_payload( __ID114__ )
            @adaptor.add_child( root_0, tree_for_ID114 )

          end
          @state.following.push( TOKENS_FOLLOWING_idvarcte_IN_varcte_1722 )
          idvarcte115 = idvarcte
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, idvarcte115.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  $id = __ID114__.text
                  $scope_location = @vars_block_stack.last.scope_location
                  $found = false
                  if not $scope_location.nil? && @vars_block_stack.last.procedures.has_key?($scope_location)
            	if @vars_block_stack.last.procedures[$scope_location][:local_vars].has_key?($id)
            	  $var = @vars_block_stack.last.procedures[$scope_location][:local_vars][$id]
            	  $found = true
            	end
                  end
                  if not $found
            	if @vars_block_stack.last.global.has_key?($id)
            	  $var = @vars_block_stack.last.global[$id]
            	else
            	  abort("\nERROR: Variable #{$id} is not defined\n")
            	end
                  end
                  if not @vars_block_stack.last.sign_variable.nil?
            	if $var[:type] == 'string'
            	  abort("\nERROR: Cannot apply #{@vars_block_stack.last.sign_variable} to string #{$var[:id]}\n")
            	elsif $var[:type] == 'boolean'
            	  abort("\nERRO: Cannot apply #{@vars_block_stack.last.sign_variable} to boolean #{$var[:id]}\n")
            	elsif @vars_block_stack.last.sign_variable == '-'
            	  $var[:value] = - $var[:value]
            	  @vars_block_stack.last.sign_variable = nil
            	end
                  end
                  @vars_block_stack.last.operands_stack.push( $var )
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 615:7: CTEI
          __CTEI116__ = match( CTEI, TOKENS_FOLLOWING_CTEI_IN_varcte_1732 )
          if @state.backtracking == 0

            tree_for_CTEI116 = @adaptor.create_with_payload( __CTEI116__ )
            @adaptor.add_child( root_0, tree_for_CTEI116 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  $var = { id: nil, type: 'int', value: __CTEI116__.text.to_i }
                  @vars_block_stack.last.operands_stack.push( $var )
                
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 619:7: CTEF
          __CTEF117__ = match( CTEF, TOKENS_FOLLOWING_CTEF_IN_varcte_1742 )
          if @state.backtracking == 0

            tree_for_CTEF117 = @adaptor.create_with_payload( __CTEF117__ )
            @adaptor.add_child( root_0, tree_for_CTEF117 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  $var = { id: nil, type: 'float', value: __CTEF117__.text.to_f }
                  @vars_block_stack.last.operands_stack.push( $var )
                
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 623:7: CTES
          __CTES118__ = match( CTES, TOKENS_FOLLOWING_CTES_IN_varcte_1752 )
          if @state.backtracking == 0

            tree_for_CTES118 = @adaptor.create_with_payload( __CTES118__ )
            @adaptor.add_child( root_0, tree_for_CTES118 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
                  if not @vars_block_stack.last.sign_variable.nil?
            	abort("\nERROR: You cannot apply '+' or '-' to the string #{__CTES118__.text}\n")
                  end
                  @vars_block_stack.last.operands_stack.push({ id: nil, type: 'string', value: __CTES118__.text })
                
            # <-- action
          end

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 629:7: CTEB
          __CTEB119__ = match( CTEB, TOKENS_FOLLOWING_CTEB_IN_varcte_1762 )
          if @state.backtracking == 0

            tree_for_CTEB119 = @adaptor.create_with_payload( __CTEB119__ )
            @adaptor.add_child( root_0, tree_for_CTEB119 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
                  if not @vars_block_stack.last.sign_variable.nil?
            	abort("\nERROR: You cannot apply '+' or '-' to boolean\n")
                  end
                  @vars_block_stack.last.operands_stack.push({ id: nil, type: 'boolean', value: __CTEB119__.text == 'true' })
                
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    IdvarcteReturnValue = define_return_scope 

    # 
    # parser rule idvarcte
    # 
    # (in Simple_copy.g)
    # 637:1: idvarcte : ( | llamada | array );
    # 
    def idvarcte
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = IdvarcteReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      llamada120 = nil
      array121 = nil


      begin
        # at line 637:9: ( | llamada | array )
        alt_25 = 3
        case look_25 = @input.peek( 1 )
        when EOF, RPARENT, RSBRACK, COMMA, SEMICOLON, PLUS, MINUS, TIMES, DIVIDE then alt_25 = 1
        when LPARENT then alt_25 = 2
        when LSBRACK then alt_25 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 25, 0 )
        end
        case alt_25
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 638:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 638:7: llamada
          @state.following.push( TOKENS_FOLLOWING_llamada_IN_idvarcte_1784 )
          llamada120 = llamada
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, llamada120.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[IDVARCTE] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 639:7: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_idvarcte_1794 )
          array121 = array
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, array121.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[IDVARCTE] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    ComparacionReturnValue = define_return_scope 

    # 
    # parser rule comparacion
    # 
    # (in Simple_copy.g)
    # 642:1: comparacion : ( LT | LE | GT | GE | EQ | NE );
    # 
    def comparacion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = ComparacionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __LT122__ = nil
      __LE123__ = nil
      __GT124__ = nil
      __GE125__ = nil
      __EQ126__ = nil
      __NE127__ = nil

      tree_for_LT122 = nil
      tree_for_LE123 = nil
      tree_for_GT124 = nil
      tree_for_GE125 = nil
      tree_for_EQ126 = nil
      tree_for_NE127 = nil

      begin
        # at line 642:12: ( LT | LE | GT | GE | EQ | NE )
        alt_26 = 6
        case look_26 = @input.peek( 1 )
        when LT then alt_26 = 1
        when LE then alt_26 = 2
        when GT then alt_26 = 3
        when GE then alt_26 = 4
        when EQ then alt_26 = 5
        when NE then alt_26 = 6
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 26, 0 )
        end
        case alt_26
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 643:5: LT
          __LT122__ = match( LT, TOKENS_FOLLOWING_LT_IN_comparacion_1812 )
          if @state.backtracking == 0

            tree_for_LT122 = @adaptor.create_with_payload( __LT122__ )
            @adaptor.add_child( root_0, tree_for_LT122 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            	@vars_block_stack.last.operations_stack.push( __LT122__.text )
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 646:7: LE
          __LE123__ = match( LE, TOKENS_FOLLOWING_LE_IN_comparacion_1822 )
          if @state.backtracking == 0

            tree_for_LE123 = @adaptor.create_with_payload( __LE123__ )
            @adaptor.add_child( root_0, tree_for_LE123 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            	@vars_block_stack.last.operations_stack.push( __LE123__.text )
                
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 649:7: GT
          __GT124__ = match( GT, TOKENS_FOLLOWING_GT_IN_comparacion_1832 )
          if @state.backtracking == 0

            tree_for_GT124 = @adaptor.create_with_payload( __GT124__ )
            @adaptor.add_child( root_0, tree_for_GT124 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            	@vars_block_stack.last.operations_stack.push( __GT124__.text )
                
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 652:7: GE
          __GE125__ = match( GE, TOKENS_FOLLOWING_GE_IN_comparacion_1842 )
          if @state.backtracking == 0

            tree_for_GE125 = @adaptor.create_with_payload( __GE125__ )
            @adaptor.add_child( root_0, tree_for_GE125 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

            	@vars_block_stack.last.operations_stack.push( __GE125__.text )
                
            # <-- action
          end

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 655:7: EQ
          __EQ126__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_comparacion_1852 )
          if @state.backtracking == 0

            tree_for_EQ126 = @adaptor.create_with_payload( __EQ126__ )
            @adaptor.add_child( root_0, tree_for_EQ126 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

            	@vars_block_stack.last.operations_stack.push( __EQ126__.text )
                
            # <-- action
          end

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 658:7: NE
          __NE127__ = match( NE, TOKENS_FOLLOWING_NE_IN_comparacion_1862 )
          if @state.backtracking == 0

            tree_for_NE127 = @adaptor.create_with_payload( __NE127__ )
            @adaptor.add_child( root_0, tree_for_NE127 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[COMPARACION] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 35 )

      end
      
      return return_value
    end

    LogicoReturnValue = define_return_scope 

    # 
    # parser rule logico
    # 
    # (in Simple_copy.g)
    # 661:1: logico : ( AND | OR );
    # 
    def logico
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = LogicoReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND128__ = nil
      __OR129__ = nil

      tree_for_AND128 = nil
      tree_for_OR129 = nil

      begin
        # at line 661:7: ( AND | OR )
        alt_27 = 2
        look_27_0 = @input.peek( 1 )

        if ( look_27_0 == AND )
          alt_27 = 1
        elsif ( look_27_0 == OR )
          alt_27 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 27, 0 )
        end
        case alt_27
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 662:5: AND
          __AND128__ = match( AND, TOKENS_FOLLOWING_AND_IN_logico_1880 )
          if @state.backtracking == 0

            tree_for_AND128 = @adaptor.create_with_payload( __AND128__ )
            @adaptor.add_child( root_0, tree_for_AND128 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

            	@vars_block_stack.last.operations_stack.push( __AND128__.text )
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 665:7: OR
          __OR129__ = match( OR, TOKENS_FOLLOWING_OR_IN_logico_1890 )
          if @state.backtracking == 0

            tree_for_OR129 = @adaptor.create_with_payload( __OR129__ )
            @adaptor.add_child( root_0, tree_for_OR129 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            	@vars_block_stack.last.operations_stack.push( __OR129__.text )
                
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 36 )

      end
      
      return return_value
    end

    RetornoReturnValue = define_return_scope 

    # 
    # parser rule retorno
    # 
    # (in Simple_copy.g)
    # 670:1: retorno : ( | exp );
    # 
    def retorno
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = RetornoReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      exp130 = nil


      begin
        # at line 670:8: ( | exp )
        alt_28 = 2
        look_28_0 = @input.peek( 1 )

        if ( look_28_0 == SEMICOLON )
          alt_28 = 1
        elsif ( look_28_0 == NOT || look_28_0 == LPARENT || look_28_0.between?( CTEI, CTEF ) || look_28_0.between?( CTES, CTEB ) || look_28_0 == ID )
          alt_28 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 28, 0 )
        end
        case alt_28
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 671:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 671:7: exp
          @state.following.push( TOKENS_FOLLOWING_exp_IN_retorno_1912 )
          exp130 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp130.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[RETORNO] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 37 )

      end
      
      return return_value
    end

    CondicionReturnValue = define_return_scope 

    # 
    # parser rule condicion
    # 
    # (in Simple_copy.g)
    # 674:1: condicion : IF LPARENT expresion RPARENT LBRACK est RBRACK elsecondicion ;
    # 
    def condicion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = CondicionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF131__ = nil
      __LPARENT132__ = nil
      __RPARENT134__ = nil
      __LBRACK135__ = nil
      __RBRACK137__ = nil
      expresion133 = nil
      est136 = nil
      elsecondicion138 = nil

      tree_for_IF131 = nil
      tree_for_LPARENT132 = nil
      tree_for_RPARENT134 = nil
      tree_for_LBRACK135 = nil
      tree_for_RBRACK137 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 675:5: IF LPARENT expresion RPARENT LBRACK est RBRACK elsecondicion
        __IF131__ = match( IF, TOKENS_FOLLOWING_IF_IN_condicion_1930 )
        if @state.backtracking == 0

          tree_for_IF131 = @adaptor.create_with_payload( __IF131__ )
          @adaptor.add_child( root_0, tree_for_IF131 )

        end
        __LPARENT132__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_condicion_1932 )
        if @state.backtracking == 0

          tree_for_LPARENT132 = @adaptor.create_with_payload( __LPARENT132__ )
          @adaptor.add_child( root_0, tree_for_LPARENT132 )

        end
        @state.following.push( TOKENS_FOLLOWING_expresion_IN_condicion_1934 )
        expresion133 = expresion
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expresion133.tree )
        end
        __RPARENT134__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_condicion_1936 )
        if @state.backtracking == 0

          tree_for_RPARENT134 = @adaptor.create_with_payload( __RPARENT134__ )
          @adaptor.add_child( root_0, tree_for_RPARENT134 )

        end
        __LBRACK135__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_condicion_1938 )
        if @state.backtracking == 0

          tree_for_LBRACK135 = @adaptor.create_with_payload( __LBRACK135__ )
          @adaptor.add_child( root_0, tree_for_LBRACK135 )

        end
        @state.following.push( TOKENS_FOLLOWING_est_IN_condicion_1940 )
        est136 = est
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, est136.tree )
        end
        __RBRACK137__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_condicion_1942 )
        if @state.backtracking == 0

          tree_for_RBRACK137 = @adaptor.create_with_payload( __RBRACK137__ )
          @adaptor.add_child( root_0, tree_for_RBRACK137 )

        end
        @state.following.push( TOKENS_FOLLOWING_elsecondicion_IN_condicion_1944 )
        elsecondicion138 = elsecondicion
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, elsecondicion138.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           print("[CONDICION] ") 
          # <-- action
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 38 )

      end
      
      return return_value
    end

    ElsecondicionReturnValue = define_return_scope 

    # 
    # parser rule elsecondicion
    # 
    # (in Simple_copy.g)
    # 678:1: elsecondicion : ( | ELSE LBRACK est RBRACK );
    # 
    def elsecondicion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = ElsecondicionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ELSE139__ = nil
      __LBRACK140__ = nil
      __RBRACK142__ = nil
      est141 = nil

      tree_for_ELSE139 = nil
      tree_for_LBRACK140 = nil
      tree_for_RBRACK142 = nil

      begin
        # at line 678:14: ( | ELSE LBRACK est RBRACK )
        alt_29 = 2
        look_29_0 = @input.peek( 1 )

        if ( look_29_0 == EOF || look_29_0.between?( RETURN, IF ) || look_29_0.between?( PRINT, INPUT ) || look_29_0 == RBRACK || look_29_0 == ID )
          alt_29 = 1
        elsif ( look_29_0 == ELSE )
          alt_29 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 29, 0 )
        end
        case alt_29
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 679:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 679:7: ELSE LBRACK est RBRACK
          __ELSE139__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_elsecondicion_1966 )
          if @state.backtracking == 0

            tree_for_ELSE139 = @adaptor.create_with_payload( __ELSE139__ )
            @adaptor.add_child( root_0, tree_for_ELSE139 )

          end
          __LBRACK140__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_elsecondicion_1968 )
          if @state.backtracking == 0

            tree_for_LBRACK140 = @adaptor.create_with_payload( __LBRACK140__ )
            @adaptor.add_child( root_0, tree_for_LBRACK140 )

          end
          @state.following.push( TOKENS_FOLLOWING_est_IN_elsecondicion_1970 )
          est141 = est
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, est141.tree )
          end
          __RBRACK142__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_elsecondicion_1972 )
          if @state.backtracking == 0

            tree_for_RBRACK142 = @adaptor.create_with_payload( __RBRACK142__ )
            @adaptor.add_child( root_0, tree_for_RBRACK142 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[ELSECONDICION] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 39 )

      end
      
      return return_value
    end

    EscrituraReturnValue = define_return_scope 

    # 
    # parser rule escritura
    # 
    # (in Simple_copy.g)
    # 682:1: escritura : PRINT LPARENT argsescritura RPARENT SEMICOLON ;
    # 
    def escritura
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = EscrituraReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT143__ = nil
      __LPARENT144__ = nil
      __RPARENT146__ = nil
      __SEMICOLON147__ = nil
      argsescritura145 = nil

      tree_for_PRINT143 = nil
      tree_for_LPARENT144 = nil
      tree_for_RPARENT146 = nil
      tree_for_SEMICOLON147 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 683:5: PRINT LPARENT argsescritura RPARENT SEMICOLON
        __PRINT143__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_escritura_1990 )
        if @state.backtracking == 0

          tree_for_PRINT143 = @adaptor.create_with_payload( __PRINT143__ )
          @adaptor.add_child( root_0, tree_for_PRINT143 )

        end
        __LPARENT144__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_escritura_1992 )
        if @state.backtracking == 0

          tree_for_LPARENT144 = @adaptor.create_with_payload( __LPARENT144__ )
          @adaptor.add_child( root_0, tree_for_LPARENT144 )

        end
        @state.following.push( TOKENS_FOLLOWING_argsescritura_IN_escritura_1994 )
        argsescritura145 = argsescritura
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, argsescritura145.tree )
        end
        __RPARENT146__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_escritura_1996 )
        if @state.backtracking == 0

          tree_for_RPARENT146 = @adaptor.create_with_payload( __RPARENT146__ )
          @adaptor.add_child( root_0, tree_for_RPARENT146 )

        end
        __SEMICOLON147__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_escritura_1998 )
        if @state.backtracking == 0

          tree_for_SEMICOLON147 = @adaptor.create_with_payload( __SEMICOLON147__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON147 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           print("[ESCRITURA] ") 
          # <-- action
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 40 )

      end
      
      return return_value
    end

    ArgsescrituraReturnValue = define_return_scope 

    # 
    # parser rule argsescritura
    # 
    # (in Simple_copy.g)
    # 686:1: argsescritura : exp argsescrituraaux ;
    # 
    def argsescritura
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = ArgsescrituraReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      exp148 = nil
      argsescrituraaux149 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 687:5: exp argsescrituraaux
        @state.following.push( TOKENS_FOLLOWING_exp_IN_argsescritura_2016 )
        exp148 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp148.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_argsescrituraaux_IN_argsescritura_2018 )
        argsescrituraaux149 = argsescrituraaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, argsescrituraaux149.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           print("[ARGSESCRITURA] ") 
          # <-- action
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 41 )

      end
      
      return return_value
    end

    ArgsescrituraauxReturnValue = define_return_scope 

    # 
    # parser rule argsescrituraaux
    # 
    # (in Simple_copy.g)
    # 690:1: argsescrituraaux : ( | COMMA argsescritura );
    # 
    def argsescrituraaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = ArgsescrituraauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA150__ = nil
      argsescritura151 = nil

      tree_for_COMMA150 = nil

      begin
        # at line 690:17: ( | COMMA argsescritura )
        alt_30 = 2
        look_30_0 = @input.peek( 1 )

        if ( look_30_0 == RPARENT )
          alt_30 = 1
        elsif ( look_30_0 == COMMA )
          alt_30 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 30, 0 )
        end
        case alt_30
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 691:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 691:7: COMMA argsescritura
          __COMMA150__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsescrituraaux_2040 )
          if @state.backtracking == 0

            tree_for_COMMA150 = @adaptor.create_with_payload( __COMMA150__ )
            @adaptor.add_child( root_0, tree_for_COMMA150 )

          end
          @state.following.push( TOKENS_FOLLOWING_argsescritura_IN_argsescrituraaux_2042 )
          argsescritura151 = argsescritura
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, argsescritura151.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[ARGSESCRITURAAUX] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 42 )

      end
      
      return return_value
    end

    CicloReturnValue = define_return_scope 

    # 
    # parser rule ciclo
    # 
    # (in Simple_copy.g)
    # 694:1: ciclo : FOR LPARENT cicloaux SEMICOLON expresion SEMICOLON cicloaux RPARENT LBRACK est RBRACK ;
    # 
    def ciclo
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = CicloReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR152__ = nil
      __LPARENT153__ = nil
      __SEMICOLON155__ = nil
      __SEMICOLON157__ = nil
      __RPARENT159__ = nil
      __LBRACK160__ = nil
      __RBRACK162__ = nil
      cicloaux154 = nil
      expresion156 = nil
      cicloaux158 = nil
      est161 = nil

      tree_for_FOR152 = nil
      tree_for_LPARENT153 = nil
      tree_for_SEMICOLON155 = nil
      tree_for_SEMICOLON157 = nil
      tree_for_RPARENT159 = nil
      tree_for_LBRACK160 = nil
      tree_for_RBRACK162 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 695:5: FOR LPARENT cicloaux SEMICOLON expresion SEMICOLON cicloaux RPARENT LBRACK est RBRACK
        __FOR152__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_ciclo_2060 )
        if @state.backtracking == 0

          tree_for_FOR152 = @adaptor.create_with_payload( __FOR152__ )
          @adaptor.add_child( root_0, tree_for_FOR152 )

        end
        __LPARENT153__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_ciclo_2062 )
        if @state.backtracking == 0

          tree_for_LPARENT153 = @adaptor.create_with_payload( __LPARENT153__ )
          @adaptor.add_child( root_0, tree_for_LPARENT153 )

        end
        @state.following.push( TOKENS_FOLLOWING_cicloaux_IN_ciclo_2064 )
        cicloaux154 = cicloaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, cicloaux154.tree )
        end
        __SEMICOLON155__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_ciclo_2066 )
        if @state.backtracking == 0

          tree_for_SEMICOLON155 = @adaptor.create_with_payload( __SEMICOLON155__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON155 )

        end
        @state.following.push( TOKENS_FOLLOWING_expresion_IN_ciclo_2068 )
        expresion156 = expresion
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expresion156.tree )
        end
        __SEMICOLON157__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_ciclo_2070 )
        if @state.backtracking == 0

          tree_for_SEMICOLON157 = @adaptor.create_with_payload( __SEMICOLON157__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON157 )

        end
        @state.following.push( TOKENS_FOLLOWING_cicloaux_IN_ciclo_2072 )
        cicloaux158 = cicloaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, cicloaux158.tree )
        end
        __RPARENT159__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_ciclo_2074 )
        if @state.backtracking == 0

          tree_for_RPARENT159 = @adaptor.create_with_payload( __RPARENT159__ )
          @adaptor.add_child( root_0, tree_for_RPARENT159 )

        end
        __LBRACK160__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_ciclo_2076 )
        if @state.backtracking == 0

          tree_for_LBRACK160 = @adaptor.create_with_payload( __LBRACK160__ )
          @adaptor.add_child( root_0, tree_for_LBRACK160 )

        end
        @state.following.push( TOKENS_FOLLOWING_est_IN_ciclo_2078 )
        est161 = est
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, est161.tree )
        end
        __RBRACK162__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_ciclo_2080 )
        if @state.backtracking == 0

          tree_for_RBRACK162 = @adaptor.create_with_payload( __RBRACK162__ )
          @adaptor.add_child( root_0, tree_for_RBRACK162 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           print("[CICLO] ") 
          # <-- action
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 43 )

      end
      
      return return_value
    end

    CicloauxReturnValue = define_return_scope 

    # 
    # parser rule cicloaux
    # 
    # (in Simple_copy.g)
    # 698:1: cicloaux : ( | ID cicloauxx ASSIGN exp );
    # 
    def cicloaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = CicloauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID163__ = nil
      __ASSIGN165__ = nil
      cicloauxx164 = nil
      exp166 = nil

      tree_for_ID163 = nil
      tree_for_ASSIGN165 = nil

      begin
        # at line 698:9: ( | ID cicloauxx ASSIGN exp )
        alt_31 = 2
        look_31_0 = @input.peek( 1 )

        if ( look_31_0 == RPARENT || look_31_0 == SEMICOLON )
          alt_31 = 1
        elsif ( look_31_0 == ID )
          alt_31 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 31, 0 )
        end
        case alt_31
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 699:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 699:7: ID cicloauxx ASSIGN exp
          __ID163__ = match( ID, TOKENS_FOLLOWING_ID_IN_cicloaux_2102 )
          if @state.backtracking == 0

            tree_for_ID163 = @adaptor.create_with_payload( __ID163__ )
            @adaptor.add_child( root_0, tree_for_ID163 )

          end
          @state.following.push( TOKENS_FOLLOWING_cicloauxx_IN_cicloaux_2104 )
          cicloauxx164 = cicloauxx
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, cicloauxx164.tree )
          end
          __ASSIGN165__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_cicloaux_2106 )
          if @state.backtracking == 0

            tree_for_ASSIGN165 = @adaptor.create_with_payload( __ASSIGN165__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN165 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_cicloaux_2108 )
          exp166 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp166.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[CICLOAUX] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 44 )

      end
      
      return return_value
    end

    CicloauxxReturnValue = define_return_scope 

    # 
    # parser rule cicloauxx
    # 
    # (in Simple_copy.g)
    # 702:1: cicloauxx : ( | array );
    # 
    def cicloauxx
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = CicloauxxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      array167 = nil


      begin
        # at line 702:10: ( | array )
        alt_32 = 2
        look_32_0 = @input.peek( 1 )

        if ( look_32_0 == ASSIGN )
          alt_32 = 1
        elsif ( look_32_0 == LSBRACK )
          alt_32 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 32, 0 )
        end
        case alt_32
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 703:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 703:7: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_cicloauxx_2130 )
          array167 = array
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, array167.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[CICLOAUXX] ") 
            # <-- action
          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 45 )

      end
      
      return return_value
    end

    LecturaReturnValue = define_return_scope 

    # 
    # parser rule lectura
    # 
    # (in Simple_copy.g)
    # 706:1: lectura : INPUT LPARENT tipo COMMA ID RPARENT SEMICOLON ;
    # 
    def lectura
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = LecturaReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __INPUT168__ = nil
      __LPARENT169__ = nil
      __COMMA171__ = nil
      __ID172__ = nil
      __RPARENT173__ = nil
      __SEMICOLON174__ = nil
      tipo170 = nil

      tree_for_INPUT168 = nil
      tree_for_LPARENT169 = nil
      tree_for_COMMA171 = nil
      tree_for_ID172 = nil
      tree_for_RPARENT173 = nil
      tree_for_SEMICOLON174 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 707:5: INPUT LPARENT tipo COMMA ID RPARENT SEMICOLON
        __INPUT168__ = match( INPUT, TOKENS_FOLLOWING_INPUT_IN_lectura_2148 )
        if @state.backtracking == 0

          tree_for_INPUT168 = @adaptor.create_with_payload( __INPUT168__ )
          @adaptor.add_child( root_0, tree_for_INPUT168 )

        end
        __LPARENT169__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_lectura_2150 )
        if @state.backtracking == 0

          tree_for_LPARENT169 = @adaptor.create_with_payload( __LPARENT169__ )
          @adaptor.add_child( root_0, tree_for_LPARENT169 )

        end
        @state.following.push( TOKENS_FOLLOWING_tipo_IN_lectura_2152 )
        tipo170 = tipo
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, tipo170.tree )
        end
        __COMMA171__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_lectura_2154 )
        if @state.backtracking == 0

          tree_for_COMMA171 = @adaptor.create_with_payload( __COMMA171__ )
          @adaptor.add_child( root_0, tree_for_COMMA171 )

        end
        __ID172__ = match( ID, TOKENS_FOLLOWING_ID_IN_lectura_2156 )
        if @state.backtracking == 0

          tree_for_ID172 = @adaptor.create_with_payload( __ID172__ )
          @adaptor.add_child( root_0, tree_for_ID172 )

        end
        __RPARENT173__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_lectura_2158 )
        if @state.backtracking == 0

          tree_for_RPARENT173 = @adaptor.create_with_payload( __RPARENT173__ )
          @adaptor.add_child( root_0, tree_for_RPARENT173 )

        end
        __SEMICOLON174__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_lectura_2160 )
        if @state.backtracking == 0

          tree_for_SEMICOLON174 = @adaptor.create_with_payload( __SEMICOLON174__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON174 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           print("[LECTURA] ") 
          # <-- action
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 46 )

      end
      
      return return_value
    end

    MainReturnValue = define_return_scope 

    # 
    # parser rule main
    # 
    # (in Simple_copy.g)
    # 710:1: main : MAIN LPARENT RPARENT LBRACK var est RBRACK ;
    # 
    def main
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )
      return_value = MainReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MAIN175__ = nil
      __LPARENT176__ = nil
      __RPARENT177__ = nil
      __LBRACK178__ = nil
      __RBRACK181__ = nil
      var179 = nil
      est180 = nil

      tree_for_MAIN175 = nil
      tree_for_LPARENT176 = nil
      tree_for_RPARENT177 = nil
      tree_for_LBRACK178 = nil
      tree_for_RBRACK181 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 711:5: MAIN LPARENT RPARENT LBRACK var est RBRACK
        __MAIN175__ = match( MAIN, TOKENS_FOLLOWING_MAIN_IN_main_2178 )
        if @state.backtracking == 0

          tree_for_MAIN175 = @adaptor.create_with_payload( __MAIN175__ )
          @adaptor.add_child( root_0, tree_for_MAIN175 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           
          	@vars_block_stack.last.scope_location = __MAIN175__.text 
          	if not @vars_block_stack.last.procedures.has_key?(@vars_block_stack.last.scope_location)
          	  @vars_block_stack.last.procedures[@vars_block_stack.last.scope_location] = { id: @vars_block_stack.last.scope_location, args: nil, local_vars: Hash.new, return_type: 'void' }
          	else
          	  abort("\nERROR: The program can only have one main procedure\n")
          	end
              
          # <-- action
        end
        __LPARENT176__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_main_2182 )
        if @state.backtracking == 0

          tree_for_LPARENT176 = @adaptor.create_with_payload( __LPARENT176__ )
          @adaptor.add_child( root_0, tree_for_LPARENT176 )

        end
        __RPARENT177__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_main_2184 )
        if @state.backtracking == 0

          tree_for_RPARENT177 = @adaptor.create_with_payload( __RPARENT177__ )
          @adaptor.add_child( root_0, tree_for_RPARENT177 )

        end
        __LBRACK178__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_main_2186 )
        if @state.backtracking == 0

          tree_for_LBRACK178 = @adaptor.create_with_payload( __LBRACK178__ )
          @adaptor.add_child( root_0, tree_for_LBRACK178 )

        end
        @state.following.push( TOKENS_FOLLOWING_var_IN_main_2188 )
        var179 = var
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, var179.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_est_IN_main_2190 )
        est180 = est
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, est180.tree )
        end
        __RBRACK181__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_main_2192 )
        if @state.backtracking == 0

          tree_for_RBRACK181 = @adaptor.create_with_payload( __RBRACK181__ )
          @adaptor.add_child( root_0, tree_for_RBRACK181 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           print("[MAIN] ") 
          # <-- action
        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )

        if @state.backtracking == 0

          return_value.tree = @adaptor.rule_post_processing( root_0 )
          @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 47 )

      end
      
      return return_value
    end

    # 
    # syntactic predicate synpred6_Simple
    # 
    # (in Simple_copy.g)
    # 334:5: synpred6_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred6_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )

      # at line 334:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 53 )

    end
    # 
    # syntactic predicate synpred7_Simple
    # 
    # (in Simple_copy.g)
    # 335:5: synpred7_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred7_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )

      # at line 335:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )

    end
    # 
    # syntactic predicate synpred8_Simple
    # 
    # (in Simple_copy.g)
    # 339:5: synpred8_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred8_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )

      # at line 339:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 55 )

    end
    # 
    # syntactic predicate synpred9_Simple
    # 
    # (in Simple_copy.g)
    # 340:5: synpred9_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred9_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )

      # at line 340:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 56 )

    end
    # 
    # syntactic predicate synpred10_Simple
    # 
    # (in Simple_copy.g)
    # 344:5: synpred10_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred10_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )

      # at line 344:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 57 )

    end
    # 
    # syntactic predicate synpred11_Simple
    # 
    # (in Simple_copy.g)
    # 345:5: synpred11_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred11_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 58 )

      # at line 345:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 58 )

    end
    # 
    # syntactic predicate synpred12_Simple
    # 
    # (in Simple_copy.g)
    # 349:5: synpred12_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred12_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 59 )

      # at line 349:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 59 )

    end
    # 
    # syntactic predicate synpred13_Simple
    # 
    # (in Simple_copy.g)
    # 350:5: synpred13_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred13_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 60 )

      # at line 350:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 60 )

    end
    # 
    # syntactic predicate synpred17_Simple
    # 
    # (in Simple_copy.g)
    # 361:5: synpred17_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred17_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 64 )

      # at line 361:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 64 )

    end
    # 
    # syntactic predicate synpred18_Simple
    # 
    # (in Simple_copy.g)
    # 362:5: synpred18_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred18_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 65 )

      # at line 362:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 65 )

    end


    TOKENS_FOLLOWING_programa_IN_vars_block_589 = Set[ 1 ]
    TOKENS_FOLLOWING_var_IN_programa_604 = Set[ 9, 11 ]
    TOKENS_FOLLOWING_func_IN_programa_606 = Set[ 9, 11 ]
    TOKENS_FOLLOWING_main_IN_programa_608 = Set[ 1 ]
    TOKENS_FOLLOWING_variables_IN_var_626 = Set[ 4, 5, 6, 7, 8 ]
    TOKENS_FOLLOWING_var_IN_var_628 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_variables_644 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_646 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_assignint_IN_variables_650 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_652 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_variables_662 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_664 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_assignfloat_IN_variables_668 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_670 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_variables_680 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_682 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_assignstring_IN_variables_686 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_688 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_variables_698 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_700 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_assignboolean_IN_variables_704 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_706 = Set[ 1 ]
    TOKENS_FOLLOWING_ARRAY_IN_variables_716 = Set[ 4, 5, 6, 7 ]
    TOKENS_FOLLOWING_tipo_IN_variables_720 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_722 = Set[ 37 ]
    TOKENS_FOLLOWING_COLON_IN_variables_724 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_variables_726 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_728 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignint_761 = Set[ 43 ]
    TOKENS_FOLLOWING_CTEI_IN_assignint_763 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignfloat_794 = Set[ 44 ]
    TOKENS_FOLLOWING_CTEF_IN_assignfloat_796 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignstring_828 = Set[ 46 ]
    TOKENS_FOLLOWING_CTES_IN_assignstring_830 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignboolean_861 = Set[ 47 ]
    TOKENS_FOLLOWING_CTEB_IN_assignboolean_863 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_tipo_886 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_tipo_896 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_tipo_906 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_tipo_916 = Set[ 1 ]
    TOKENS_FOLLOWING_funcion_IN_func_944 = Set[ 11 ]
    TOKENS_FOLLOWING_func_IN_func_946 = Set[ 1 ]
    TOKENS_FOLLOWING_FUNCTION_IN_funcion_964 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_funcion_966 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_funcion_970 = Set[ 4, 5, 6, 7, 31 ]
    TOKENS_FOLLOWING_argumentos_IN_funcion_974 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_funcion_976 = Set[ 37 ]
    TOKENS_FOLLOWING_COLON_IN_funcion_978 = Set[ 4, 5, 6, 7, 10 ]
    TOKENS_FOLLOWING_retornofunc_IN_funcion_982 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_funcion_990 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_var_IN_funcion_992 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_funcion_994 = Set[ 12 ]
    TOKENS_FOLLOWING_RETURN_IN_funcion_996 = Set[ 25, 30, 36, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_retorno_IN_funcion_998 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_funcion_1000 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_funcion_1002 = Set[ 1 ]
    TOKENS_FOLLOWING_tipo_IN_argumentos_1028 = Set[ 35, 49 ]
    TOKENS_FOLLOWING_ref_IN_argumentos_1030 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_argumentos_1032 = Set[ 34 ]
    TOKENS_FOLLOWING_argumentoaux_IN_argumentos_1036 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argumentoaux_1061 = Set[ 4, 5, 6, 7 ]
    TOKENS_FOLLOWING_tipo_IN_argumentoaux_1065 = Set[ 35, 49 ]
    TOKENS_FOLLOWING_ref_IN_argumentoaux_1067 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_argumentoaux_1069 = Set[ 34 ]
    TOKENS_FOLLOWING_argumentoaux_IN_argumentoaux_1073 = Set[ 1 ]
    TOKENS_FOLLOWING_REF_IN_ref_1095 = Set[ 1 ]
    TOKENS_FOLLOWING_VOID_IN_retornofunc_1116 = Set[ 1 ]
    TOKENS_FOLLOWING_tipo_IN_retornofunc_1128 = Set[ 1 ]
    TOKENS_FOLLOWING_estatutos_IN_est_1146 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_estaux_IN_est_1148 = Set[ 1 ]
    TOKENS_FOLLOWING_estatutos_IN_estaux_1170 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_estaux_IN_estaux_1172 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_estatutos_1190 = Set[ 18, 30, 32 ]
    TOKENS_FOLLOWING_idestatutos_IN_estatutos_1198 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_estatutos_1200 = Set[ 1 ]
    TOKENS_FOLLOWING_condicion_IN_estatutos_1210 = Set[ 1 ]
    TOKENS_FOLLOWING_escritura_IN_estatutos_1220 = Set[ 1 ]
    TOKENS_FOLLOWING_ciclo_IN_estatutos_1230 = Set[ 1 ]
    TOKENS_FOLLOWING_lectura_IN_estatutos_1240 = Set[ 1 ]
    TOKENS_FOLLOWING_llamada_IN_idestatutos_1258 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_idestatutos_1268 = Set[ 18 ]
    TOKENS_FOLLOWING_ASSIGN_IN_idestatutos_1270 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_idestatutos_1272 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_idestatutos_1282 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_idestatutos_1290 = Set[ 1 ]
    TOKENS_FOLLOWING_LPARENT_IN_llamada_1307 = Set[ 25, 30, 31, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_llamadaargs_IN_llamada_1309 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_llamada_1311 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_llamadaargs_1333 = Set[ 34 ]
    TOKENS_FOLLOWING_llamadaargsaux_IN_llamadaargs_1335 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_llamadaargsaux_1357 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_llamadaargsaux_1359 = Set[ 34 ]
    TOKENS_FOLLOWING_llamadaargsaux_IN_llamadaargsaux_1361 = Set[ 1 ]
    TOKENS_FOLLOWING_LSBRACK_IN_array_1379 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_array_1381 = Set[ 33 ]
    TOKENS_FOLLOWING_RSBRACK_IN_array_1383 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_expresion_1401 = Set[ 1 ]
    TOKENS_FOLLOWING_comparacion_IN_expresionaux_1427 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_expresionaux_1429 = Set[ 1 ]
    TOKENS_FOLLOWING_logico_IN_expresionaux_1440 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_expresionaux_1442 = Set[ 1 ]
    TOKENS_FOLLOWING_termino_IN_exp_1460 = Set[ 38, 39 ]
    TOKENS_FOLLOWING_expaux_IN_exp_1474 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_expaux_1494 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_expaux_1502 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expaux_1511 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_expaux_1519 = Set[ 1 ]
    TOKENS_FOLLOWING_factor_IN_termino_1536 = Set[ 40, 41 ]
    TOKENS_FOLLOWING_terminoaux_IN_termino_1545 = Set[ 1 ]
    TOKENS_FOLLOWING_TIMES_IN_terminoaux_1565 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_termino_IN_terminoaux_1574 = Set[ 1 ]
    TOKENS_FOLLOWING_DIVIDE_IN_terminoaux_1583 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_termino_IN_terminoaux_1591 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_factor_1610 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_notfactor_IN_factor_1612 = Set[ 1 ]
    TOKENS_FOLLOWING_LPARENT_IN_factor_1622 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_factor_1626 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_factor_1628 = Set[ 1 ]
    TOKENS_FOLLOWING_varcte_IN_factor_1644 = Set[ 1 ]
    TOKENS_FOLLOWING_LPARENT_IN_notfactor_1660 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_notfactor_1662 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_notfactor_1664 = Set[ 1 ]
    TOKENS_FOLLOWING_varcte_IN_notfactor_1674 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_sign_1692 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_sign_1702 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_varcte_1720 = Set[ 30, 32 ]
    TOKENS_FOLLOWING_idvarcte_IN_varcte_1722 = Set[ 1 ]
    TOKENS_FOLLOWING_CTEI_IN_varcte_1732 = Set[ 1 ]
    TOKENS_FOLLOWING_CTEF_IN_varcte_1742 = Set[ 1 ]
    TOKENS_FOLLOWING_CTES_IN_varcte_1752 = Set[ 1 ]
    TOKENS_FOLLOWING_CTEB_IN_varcte_1762 = Set[ 1 ]
    TOKENS_FOLLOWING_llamada_IN_idvarcte_1784 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_idvarcte_1794 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_comparacion_1812 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_comparacion_1822 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_comparacion_1832 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_comparacion_1842 = Set[ 1 ]
    TOKENS_FOLLOWING_EQ_IN_comparacion_1852 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_comparacion_1862 = Set[ 1 ]
    TOKENS_FOLLOWING_AND_IN_logico_1880 = Set[ 1 ]
    TOKENS_FOLLOWING_OR_IN_logico_1890 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_retorno_1912 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_condicion_1930 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_condicion_1932 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_condicion_1934 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_condicion_1936 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_condicion_1938 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_condicion_1940 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_condicion_1942 = Set[ 15 ]
    TOKENS_FOLLOWING_elsecondicion_IN_condicion_1944 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_elsecondicion_1966 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_elsecondicion_1968 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_elsecondicion_1970 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_elsecondicion_1972 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_escritura_1990 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_escritura_1992 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_argsescritura_IN_escritura_1994 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_escritura_1996 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_escritura_1998 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_argsescritura_2016 = Set[ 34 ]
    TOKENS_FOLLOWING_argsescrituraaux_IN_argsescritura_2018 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsescrituraaux_2040 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_argsescritura_IN_argsescrituraaux_2042 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_ciclo_2060 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_ciclo_2062 = Set[ 36, 49 ]
    TOKENS_FOLLOWING_cicloaux_IN_ciclo_2064 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_ciclo_2066 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_ciclo_2068 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_ciclo_2070 = Set[ 31, 49 ]
    TOKENS_FOLLOWING_cicloaux_IN_ciclo_2072 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_ciclo_2074 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_ciclo_2076 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_ciclo_2078 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_ciclo_2080 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_cicloaux_2102 = Set[ 18, 32 ]
    TOKENS_FOLLOWING_cicloauxx_IN_cicloaux_2104 = Set[ 18 ]
    TOKENS_FOLLOWING_ASSIGN_IN_cicloaux_2106 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_cicloaux_2108 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_cicloauxx_2130 = Set[ 1 ]
    TOKENS_FOLLOWING_INPUT_IN_lectura_2148 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_lectura_2150 = Set[ 4, 5, 6, 7 ]
    TOKENS_FOLLOWING_tipo_IN_lectura_2152 = Set[ 34 ]
    TOKENS_FOLLOWING_COMMA_IN_lectura_2154 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_lectura_2156 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_lectura_2158 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_lectura_2160 = Set[ 1 ]
    TOKENS_FOLLOWING_MAIN_IN_main_2178 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_main_2182 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_main_2184 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_main_2186 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_var_IN_main_2188 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_main_2190 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_main_2192 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

