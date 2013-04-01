#!/usr/bin/env ruby
#
# Simple.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Simple.g
# Generated at: 2013-03-31 20:47:57
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
# Simple.g


	require 'Auxiliar.rb'
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

    @@vars_block = Scope( "auxiliar" )


    include TokenData

    begin
      generated_using( "Simple.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
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
    # (in Simple.g)
    # 92:1: vars_block : programa ;
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

      	@vars_block_stack.last.auxiliar = Auxiliar.new


      begin
        root_0 = @adaptor.create_flat_list


        # at line 123:5: programa
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
          	$global = @vars_block_stack.last.auxiliar.global
            $global.keys.sort.each do | key |
              $var_info = $global[key]
              print("#{key} : type=#{$var_info[:type]}, value=#{$var_info[:value]}\n")
            end

            puts("\n\nFound this functions: \n")
          	$functions = @vars_block_stack.last.auxiliar.procedures
          	$functions.keys.sort.each do | key |
              $proc_info = $functions[key]
              print("#{key} : #{$proc_info}\n")
            end

            puts("\n\nCuadruples:\n")
          	$cuadruples = @vars_block_stack.last.auxiliar.cuadruples_array
          	$cuadruples.each do | cuadruple |
              puts(cuadruple.to_s)
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
    # (in Simple.g)
    # 127:1: programa : var func main ;
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


        # at line 128:5: var func main
        @state.following.push( TOKENS_FOLLOWING_var_IN_programa_605 )
        var2 = var
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, var2.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_func_IN_programa_607 )
        func3 = func
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, func3.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_main_IN_programa_609 )
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
    # (in Simple.g)
    # 131:1: var : ( | variables var );
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
        # at line 131:4: ( | variables var )
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


          # at line 132:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 132:7: variables var
          @state.following.push( TOKENS_FOLLOWING_variables_IN_var_627 )
          variables5 = variables
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, variables5.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_var_IN_var_629 )
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
    # (in Simple.g)
    # 135:1: variables : ( INT ID as_int= assignint SEMICOLON | FLOAT ID as_float= assignfloat SEMICOLON | STRING ID as_string= assignstring SEMICOLON | BOOLEAN ID as_boolean= assignboolean SEMICOLON | ARRAY data_type= tipo ID COLON exp SEMICOLON );
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
        # at line 135:10: ( INT ID as_int= assignint SEMICOLON | FLOAT ID as_float= assignfloat SEMICOLON | STRING ID as_string= assignstring SEMICOLON | BOOLEAN ID as_boolean= assignboolean SEMICOLON | ARRAY data_type= tipo ID COLON exp SEMICOLON )
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


          # at line 136:5: INT ID as_int= assignint SEMICOLON
          __INT7__ = match( INT, TOKENS_FOLLOWING_INT_IN_variables_645 )
          if @state.backtracking == 0

            tree_for_INT7 = @adaptor.create_with_payload( __INT7__ )
            @adaptor.add_child( root_0, tree_for_INT7 )

          end
          __ID8__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_647 )
          if @state.backtracking == 0

            tree_for_ID8 = @adaptor.create_with_payload( __ID8__ )
            @adaptor.add_child( root_0, tree_for_ID8 )

          end
          @state.following.push( TOKENS_FOLLOWING_assignint_IN_variables_651 )
          as_int = assignint
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, as_int.tree )
          end
          __SEMICOLON9__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_653 )
          if @state.backtracking == 0

            tree_for_SEMICOLON9 = @adaptor.create_with_payload( __SEMICOLON9__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON9 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  $var_info = { id: __ID8__.text, type: __INT7__.text, value: ( as_int.nil? ? nil : as_int.value ) }
            			@vars_block_stack.last.auxiliar.addVariable($var_info)
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 140:7: FLOAT ID as_float= assignfloat SEMICOLON
          __FLOAT10__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_variables_663 )
          if @state.backtracking == 0

            tree_for_FLOAT10 = @adaptor.create_with_payload( __FLOAT10__ )
            @adaptor.add_child( root_0, tree_for_FLOAT10 )

          end
          __ID11__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_665 )
          if @state.backtracking == 0

            tree_for_ID11 = @adaptor.create_with_payload( __ID11__ )
            @adaptor.add_child( root_0, tree_for_ID11 )

          end
          @state.following.push( TOKENS_FOLLOWING_assignfloat_IN_variables_669 )
          as_float = assignfloat
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, as_float.tree )
          end
          __SEMICOLON12__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_671 )
          if @state.backtracking == 0

            tree_for_SEMICOLON12 = @adaptor.create_with_payload( __SEMICOLON12__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON12 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            			$var_info = { id: __ID11__.text, type: __FLOAT10__.text, value: ( as_float.nil? ? nil : as_float.value ) } 
            			@vars_block_stack.last.auxiliar.addVariable($var_info)
                
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 144:7: STRING ID as_string= assignstring SEMICOLON
          __STRING13__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_variables_681 )
          if @state.backtracking == 0

            tree_for_STRING13 = @adaptor.create_with_payload( __STRING13__ )
            @adaptor.add_child( root_0, tree_for_STRING13 )

          end
          __ID14__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_683 )
          if @state.backtracking == 0

            tree_for_ID14 = @adaptor.create_with_payload( __ID14__ )
            @adaptor.add_child( root_0, tree_for_ID14 )

          end
          @state.following.push( TOKENS_FOLLOWING_assignstring_IN_variables_687 )
          as_string = assignstring
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, as_string.tree )
          end
          __SEMICOLON15__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_689 )
          if @state.backtracking == 0

            tree_for_SEMICOLON15 = @adaptor.create_with_payload( __SEMICOLON15__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON15 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            			$var_info = { id: __ID14__.text, type: __STRING13__.text, value: ( as_string.nil? ? nil : as_string.value ) }
            			@vars_block_stack.last.auxiliar.addVariable($var_info)
                
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 148:7: BOOLEAN ID as_boolean= assignboolean SEMICOLON
          __BOOLEAN16__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_variables_699 )
          if @state.backtracking == 0

            tree_for_BOOLEAN16 = @adaptor.create_with_payload( __BOOLEAN16__ )
            @adaptor.add_child( root_0, tree_for_BOOLEAN16 )

          end
          __ID17__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_701 )
          if @state.backtracking == 0

            tree_for_ID17 = @adaptor.create_with_payload( __ID17__ )
            @adaptor.add_child( root_0, tree_for_ID17 )

          end
          @state.following.push( TOKENS_FOLLOWING_assignboolean_IN_variables_705 )
          as_boolean = assignboolean
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, as_boolean.tree )
          end
          __SEMICOLON18__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_707 )
          if @state.backtracking == 0

            tree_for_SEMICOLON18 = @adaptor.create_with_payload( __SEMICOLON18__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON18 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            			$var_info = { id: __ID17__.text, type: __BOOLEAN16__.text, value: ( as_boolean.nil? ? nil : as_boolean.value ) }
            			@vars_block_stack.last.auxiliar.addVariable($var_info)
                
            # <-- action
          end

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 152:7: ARRAY data_type= tipo ID COLON exp SEMICOLON
          __ARRAY19__ = match( ARRAY, TOKENS_FOLLOWING_ARRAY_IN_variables_717 )
          if @state.backtracking == 0

            tree_for_ARRAY19 = @adaptor.create_with_payload( __ARRAY19__ )
            @adaptor.add_child( root_0, tree_for_ARRAY19 )

          end
          @state.following.push( TOKENS_FOLLOWING_tipo_IN_variables_721 )
          data_type = tipo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, data_type.tree )
          end
          __ID20__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_723 )
          if @state.backtracking == 0

            tree_for_ID20 = @adaptor.create_with_payload( __ID20__ )
            @adaptor.add_child( root_0, tree_for_ID20 )

          end
          __COLON21__ = match( COLON, TOKENS_FOLLOWING_COLON_IN_variables_725 )
          if @state.backtracking == 0

            tree_for_COLON21 = @adaptor.create_with_payload( __COLON21__ )
            @adaptor.add_child( root_0, tree_for_COLON21 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_variables_727 )
          exp22 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp22.tree )
          end
          __SEMICOLON23__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_729 )
          if @state.backtracking == 0

            tree_for_SEMICOLON23 = @adaptor.create_with_payload( __SEMICOLON23__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON23 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            			$var_info = { id: __ID20__.text, type: "[#{( data_type.nil? ? nil : data_type.type )}]" }
            			@vars_block_stack.last.auxiliar.addVariable($var_info)
                
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
    # (in Simple.g)
    # 158:1: assignint returns [value] : ( | | ASSIGN CTEI );
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
        # at line 158:25: ( | | ASSIGN CTEI )
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


          # at line 159:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 160:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 160:7: ASSIGN CTEI
          __ASSIGN24__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignint_762 )
          if @state.backtracking == 0

            tree_for_ASSIGN24 = @adaptor.create_with_payload( __ASSIGN24__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN24 )

          end
          __CTEI25__ = match( CTEI, TOKENS_FOLLOWING_CTEI_IN_assignint_764 )
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
    # (in Simple.g)
    # 163:1: assignfloat returns [value] : ( | | ASSIGN CTEF );
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
        # at line 163:27: ( | | ASSIGN CTEF )
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


          # at line 164:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 165:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 165:7: ASSIGN CTEF
          __ASSIGN26__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignfloat_795 )
          if @state.backtracking == 0

            tree_for_ASSIGN26 = @adaptor.create_with_payload( __ASSIGN26__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN26 )

          end
          __CTEF27__ = match( CTEF, TOKENS_FOLLOWING_CTEF_IN_assignfloat_797 )
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
    # (in Simple.g)
    # 168:1: assignstring returns [value] : ( | | ASSIGN CTES );
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
        # at line 168:28: ( | | ASSIGN CTES )
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


          # at line 169:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 170:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 170:7: ASSIGN CTES
          __ASSIGN28__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignstring_829 )
          if @state.backtracking == 0

            tree_for_ASSIGN28 = @adaptor.create_with_payload( __ASSIGN28__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN28 )

          end
          __CTES29__ = match( CTES, TOKENS_FOLLOWING_CTES_IN_assignstring_831 )
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
    # (in Simple.g)
    # 173:1: assignboolean returns [value] : ( | | ASSIGN CTEB );
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
        # at line 173:29: ( | | ASSIGN CTEB )
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


          # at line 174:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 175:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 175:7: ASSIGN CTEB
          __ASSIGN30__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignboolean_862 )
          if @state.backtracking == 0

            tree_for_ASSIGN30 = @adaptor.create_with_payload( __ASSIGN30__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN30 )

          end
          __CTEB31__ = match( CTEB, TOKENS_FOLLOWING_CTEB_IN_assignboolean_864 )
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
    # (in Simple.g)
    # 178:1: tipo returns [type] : ( INT | FLOAT | STRING | BOOLEAN );
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
        # at line 178:19: ( INT | FLOAT | STRING | BOOLEAN )
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


          # at line 179:5: INT
          __INT32__ = match( INT, TOKENS_FOLLOWING_INT_IN_tipo_887 )
          if @state.backtracking == 0

            tree_for_INT32 = @adaptor.create_with_payload( __INT32__ )
            @adaptor.add_child( root_0, tree_for_INT32 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = 'int' 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 180:7: FLOAT
          __FLOAT33__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_tipo_897 )
          if @state.backtracking == 0

            tree_for_FLOAT33 = @adaptor.create_with_payload( __FLOAT33__ )
            @adaptor.add_child( root_0, tree_for_FLOAT33 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = 'float' 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 181:7: STRING
          __STRING34__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_tipo_907 )
          if @state.backtracking == 0

            tree_for_STRING34 = @adaptor.create_with_payload( __STRING34__ )
            @adaptor.add_child( root_0, tree_for_STRING34 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = 'string' 
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 182:7: BOOLEAN
          __BOOLEAN35__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_tipo_917 )
          if @state.backtracking == 0

            tree_for_BOOLEAN35 = @adaptor.create_with_payload( __BOOLEAN35__ )
            @adaptor.add_child( root_0, tree_for_BOOLEAN35 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = 'boolean' 
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
    # (in Simple.g)
    # 185:1: func : ( | | funcion func );
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
        # at line 185:5: ( | | funcion func )
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


          # at line 186:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 187:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 187:7: funcion func
          @state.following.push( TOKENS_FOLLOWING_funcion_IN_func_945 )
          funcion36 = funcion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, funcion36.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_func_IN_func_947 )
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
    # (in Simple.g)
    # 190:1: funcion : FUNCTION ID LPARENT arguments= argumentos RPARENT COLON return_type= retornofunc LBRACK var est RETURN retorno SEMICOLON RBRACK ;
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


        # at line 191:5: FUNCTION ID LPARENT arguments= argumentos RPARENT COLON return_type= retornofunc LBRACK var est RETURN retorno SEMICOLON RBRACK
        __FUNCTION38__ = match( FUNCTION, TOKENS_FOLLOWING_FUNCTION_IN_funcion_965 )
        if @state.backtracking == 0

          tree_for_FUNCTION38 = @adaptor.create_with_payload( __FUNCTION38__ )
          @adaptor.add_child( root_0, tree_for_FUNCTION38 )

        end
        __ID39__ = match( ID, TOKENS_FOLLOWING_ID_IN_funcion_967 )
        if @state.backtracking == 0

          tree_for_ID39 = @adaptor.create_with_payload( __ID39__ )
          @adaptor.add_child( root_0, tree_for_ID39 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           
          			@vars_block_stack.last.auxiliar.scope_location = __ID39__.text
          		
          # <-- action
        end
        __LPARENT40__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_funcion_971 )
        if @state.backtracking == 0

          tree_for_LPARENT40 = @adaptor.create_with_payload( __LPARENT40__ )
          @adaptor.add_child( root_0, tree_for_LPARENT40 )

        end
        @state.following.push( TOKENS_FOLLOWING_argumentos_IN_funcion_975 )
        arguments = argumentos
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, arguments.tree )
        end
        __RPARENT41__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_funcion_977 )
        if @state.backtracking == 0

          tree_for_RPARENT41 = @adaptor.create_with_payload( __RPARENT41__ )
          @adaptor.add_child( root_0, tree_for_RPARENT41 )

        end
        __COLON42__ = match( COLON, TOKENS_FOLLOWING_COLON_IN_funcion_979 )
        if @state.backtracking == 0

          tree_for_COLON42 = @adaptor.create_with_payload( __COLON42__ )
          @adaptor.add_child( root_0, tree_for_COLON42 )

        end
        @state.following.push( TOKENS_FOLLOWING_retornofunc_IN_funcion_983 )
        return_type = retornofunc
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, return_type.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           
          			@vars_block_stack.last.auxiliar.addProcedure($arguments, $return_type)
              
          # <-- action
        end
        __LBRACK43__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_funcion_987 )
        if @state.backtracking == 0

          tree_for_LBRACK43 = @adaptor.create_with_payload( __LBRACK43__ )
          @adaptor.add_child( root_0, tree_for_LBRACK43 )

        end
        @state.following.push( TOKENS_FOLLOWING_var_IN_funcion_989 )
        var44 = var
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, var44.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_est_IN_funcion_991 )
        est45 = est
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, est45.tree )
        end
        __RETURN46__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_funcion_993 )
        if @state.backtracking == 0

          tree_for_RETURN46 = @adaptor.create_with_payload( __RETURN46__ )
          @adaptor.add_child( root_0, tree_for_RETURN46 )

        end
        @state.following.push( TOKENS_FOLLOWING_retorno_IN_funcion_995 )
        retorno47 = retorno
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, retorno47.tree )
        end
        __SEMICOLON48__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_funcion_997 )
        if @state.backtracking == 0

          tree_for_SEMICOLON48 = @adaptor.create_with_payload( __SEMICOLON48__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON48 )

        end
        __RBRACK49__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_funcion_999 )
        if @state.backtracking == 0

          tree_for_RBRACK49 = @adaptor.create_with_payload( __RBRACK49__ )
          @adaptor.add_child( root_0, tree_for_RBRACK49 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action

          			@vars_block_stack.last.auxiliar.scope_location = nil
          		
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
        # trace_out( __method__, 11 )

      end
      
      return return_value
    end

    ArgumentosReturnValue = define_return_scope :list

    # 
    # parser rule argumentos
    # 
    # (in Simple.g)
    # 200:1: argumentos returns [list] : ( | data_type= tipo ref ID more_args= argumentoaux );
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
        # at line 200:25: ( | data_type= tipo ref ID more_args= argumentoaux )
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


          # at line 201:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 201:7: data_type= tipo ref ID more_args= argumentoaux
          @state.following.push( TOKENS_FOLLOWING_tipo_IN_argumentos_1026 )
          data_type = tipo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, data_type.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_ref_IN_argumentos_1028 )
          ref50 = ref
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, ref50.tree )
          end
          __ID51__ = match( ID, TOKENS_FOLLOWING_ID_IN_argumentos_1030 )
          if @state.backtracking == 0

            tree_for_ID51 = @adaptor.create_with_payload( __ID51__ )
            @adaptor.add_child( root_0, tree_for_ID51 )

          end
          @state.following.push( TOKENS_FOLLOWING_argumentoaux_IN_argumentos_1034 )
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
    # (in Simple.g)
    # 207:1: argumentoaux returns [list] : ( | COMMA data_type= tipo ref ID more_args= argumentoaux );
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
        # at line 207:27: ( | COMMA data_type= tipo ref ID more_args= argumentoaux )
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


          # at line 208:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 208:7: COMMA data_type= tipo ref ID more_args= argumentoaux
          __COMMA52__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argumentoaux_1059 )
          if @state.backtracking == 0

            tree_for_COMMA52 = @adaptor.create_with_payload( __COMMA52__ )
            @adaptor.add_child( root_0, tree_for_COMMA52 )

          end
          @state.following.push( TOKENS_FOLLOWING_tipo_IN_argumentoaux_1063 )
          data_type = tipo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, data_type.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_ref_IN_argumentoaux_1065 )
          ref53 = ref
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, ref53.tree )
          end
          __ID54__ = match( ID, TOKENS_FOLLOWING_ID_IN_argumentoaux_1067 )
          if @state.backtracking == 0

            tree_for_ID54 = @adaptor.create_with_payload( __ID54__ )
            @adaptor.add_child( root_0, tree_for_ID54 )

          end
          @state.following.push( TOKENS_FOLLOWING_argumentoaux_IN_argumentoaux_1071 )
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
    # (in Simple.g)
    # 214:1: ref : ( | REF );
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
        # at line 214:4: ( | REF )
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


          # at line 215:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 215:7: REF
          __REF55__ = match( REF, TOKENS_FOLLOWING_REF_IN_ref_1093 )
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
    # (in Simple.g)
    # 218:1: retornofunc returns [type] : ( VOID | data_type= tipo );
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
        # at line 218:26: ( VOID | data_type= tipo )
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


          # at line 219:5: VOID
          __VOID56__ = match( VOID, TOKENS_FOLLOWING_VOID_IN_retornofunc_1114 )
          if @state.backtracking == 0

            tree_for_VOID56 = @adaptor.create_with_payload( __VOID56__ )
            @adaptor.add_child( root_0, tree_for_VOID56 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = 'void' 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 220:7: data_type= tipo
          @state.following.push( TOKENS_FOLLOWING_tipo_IN_retornofunc_1126 )
          data_type = tipo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, data_type.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = ( data_type && @input.to_s( data_type.start, data_type.stop ) ) 
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
    # (in Simple.g)
    # 223:1: est : estatutos estaux ;
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


        # at line 224:5: estatutos estaux
        @state.following.push( TOKENS_FOLLOWING_estatutos_IN_est_1144 )
        estatutos57 = estatutos
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, estatutos57.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_estaux_IN_est_1146 )
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
    # (in Simple.g)
    # 227:1: estaux : ( | estatutos estaux );
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
        # at line 227:7: ( | estatutos estaux )
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


          # at line 228:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 228:7: estatutos estaux
          @state.following.push( TOKENS_FOLLOWING_estatutos_IN_estaux_1168 )
          estatutos59 = estatutos
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, estatutos59.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_estaux_IN_estaux_1170 )
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
    # (in Simple.g)
    # 231:1: estatutos : ( ID idestatutos SEMICOLON | condicion | escritura | ciclo | lectura );
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
        # at line 231:10: ( ID idestatutos SEMICOLON | condicion | escritura | ciclo | lectura )
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


          # at line 232:5: ID idestatutos SEMICOLON
          __ID61__ = match( ID, TOKENS_FOLLOWING_ID_IN_estatutos_1188 )
          if @state.backtracking == 0

            tree_for_ID61 = @adaptor.create_with_payload( __ID61__ )
            @adaptor.add_child( root_0, tree_for_ID61 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            			$id = __ID61__.text
            			@vars_block_stack.last.auxiliar.addVariableToOperadStack($id)
            		
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_idestatutos_IN_estatutos_1192 )
          idestatutos62 = idestatutos
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, idestatutos62.tree )
          end
          __SEMICOLON63__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_estatutos_1194 )
          if @state.backtracking == 0

            tree_for_SEMICOLON63 = @adaptor.create_with_payload( __SEMICOLON63__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON63 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
                  $next_operation = @vars_block_stack.last.auxiliar.operations_stack.look()
                  @vars_block_stack.last.auxiliar.operations_stack.pop()
                  $oper1 = @vars_block_stack.last.auxiliar.operands_stack.look()
                  @vars_block_stack.last.auxiliar.operands_stack.pop()
                  $oper2 = @vars_block_stack.last.auxiliar.operands_stack.look()
                  @vars_block_stack.last.auxiliar.operands_stack.pop()
            			@vars_block_stack.last.auxiliar.checkCuadruple($next_operation, $oper2, $oper1)
            			$cuadruple = Cuadruples.new($next_operation, $oper1, nil, $oper2)
                  @vars_block_stack.last.auxiliar.lines_counter = @vars_block_stack.last.auxiliar.lines_counter + 1
                  @vars_block_stack.last.auxiliar.cuadruples_array << $cuadruple 
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 247:7: condicion
          @state.following.push( TOKENS_FOLLOWING_condicion_IN_estatutos_1204 )
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


          # at line 248:7: escritura
          @state.following.push( TOKENS_FOLLOWING_escritura_IN_estatutos_1214 )
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


          # at line 249:7: ciclo
          @state.following.push( TOKENS_FOLLOWING_ciclo_IN_estatutos_1224 )
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


          # at line 250:7: lectura
          @state.following.push( TOKENS_FOLLOWING_lectura_IN_estatutos_1234 )
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
    # (in Simple.g)
    # 253:1: idestatutos : ( llamada | array ASSIGN expresion | ASSIGN expresion );
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
        # at line 253:12: ( llamada | array ASSIGN expresion | ASSIGN expresion )
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


          # at line 254:5: llamada
          @state.following.push( TOKENS_FOLLOWING_llamada_IN_idestatutos_1252 )
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


          # at line 255:7: array ASSIGN expresion
          @state.following.push( TOKENS_FOLLOWING_array_IN_idestatutos_1262 )
          array69 = array
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, array69.tree )
          end
          __ASSIGN70__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_idestatutos_1264 )
          if @state.backtracking == 0

            tree_for_ASSIGN70 = @adaptor.create_with_payload( __ASSIGN70__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN70 )

          end
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_idestatutos_1266 )
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


          # at line 256:7: ASSIGN expresion
          __ASSIGN72__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_idestatutos_1276 )
          if @state.backtracking == 0

            tree_for_ASSIGN72 = @adaptor.create_with_payload( __ASSIGN72__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN72 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.auxiliar.operations_stack.push( __ASSIGN72__.text )
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_idestatutos_1284 )
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
    # (in Simple.g)
    # 262:1: llamada : LPARENT llamadaargs RPARENT ;
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


        # at line 263:5: LPARENT llamadaargs RPARENT
        __LPARENT74__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_llamada_1301 )
        if @state.backtracking == 0

          tree_for_LPARENT74 = @adaptor.create_with_payload( __LPARENT74__ )
          @adaptor.add_child( root_0, tree_for_LPARENT74 )

        end
        @state.following.push( TOKENS_FOLLOWING_llamadaargs_IN_llamada_1303 )
        llamadaargs75 = llamadaargs
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, llamadaargs75.tree )
        end
        __RPARENT76__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_llamada_1305 )
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
    # (in Simple.g)
    # 266:1: llamadaargs : ( | exp llamadaargsaux );
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
        # at line 266:12: ( | exp llamadaargsaux )
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


          # at line 267:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 267:7: exp llamadaargsaux
          @state.following.push( TOKENS_FOLLOWING_exp_IN_llamadaargs_1327 )
          exp77 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp77.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_llamadaargsaux_IN_llamadaargs_1329 )
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
    # (in Simple.g)
    # 270:1: llamadaargsaux : ( | COMMA exp llamadaargsaux );
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
        # at line 270:15: ( | COMMA exp llamadaargsaux )
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


          # at line 271:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 271:7: COMMA exp llamadaargsaux
          __COMMA79__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_llamadaargsaux_1351 )
          if @state.backtracking == 0

            tree_for_COMMA79 = @adaptor.create_with_payload( __COMMA79__ )
            @adaptor.add_child( root_0, tree_for_COMMA79 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_llamadaargsaux_1353 )
          exp80 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp80.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_llamadaargsaux_IN_llamadaargsaux_1355 )
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
    # (in Simple.g)
    # 274:1: array : LSBRACK exp RSBRACK ;
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


        # at line 275:5: LSBRACK exp RSBRACK
        __LSBRACK82__ = match( LSBRACK, TOKENS_FOLLOWING_LSBRACK_IN_array_1373 )
        if @state.backtracking == 0

          tree_for_LSBRACK82 = @adaptor.create_with_payload( __LSBRACK82__ )
          @adaptor.add_child( root_0, tree_for_LSBRACK82 )

        end
        @state.following.push( TOKENS_FOLLOWING_exp_IN_array_1375 )
        exp83 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp83.tree )
        end
        __RSBRACK84__ = match( RSBRACK, TOKENS_FOLLOWING_RSBRACK_IN_array_1377 )
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
    # (in Simple.g)
    # 278:1: expresion : exp ;
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


        # at line 279:5: exp
        @state.following.push( TOKENS_FOLLOWING_exp_IN_expresion_1395 )
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
    # (in Simple.g)
    # 283:1: expresionaux : ( | comparacion expresion | logico expresion );
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
        # at line 283:13: ( | comparacion expresion | logico expresion )
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


          # at line 284:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 284:7: comparacion expresion
          @state.following.push( TOKENS_FOLLOWING_comparacion_IN_expresionaux_1421 )
          comparacion86 = comparacion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, comparacion86.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_expresionaux_1423 )
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


          # at line 285:7: logico expresion
          @state.following.push( TOKENS_FOLLOWING_logico_IN_expresionaux_1434 )
          logico88 = logico
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, logico88.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_expresionaux_1436 )
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
    # (in Simple.g)
    # 288:1: exp : termino expaux ;
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


        # at line 289:5: termino expaux
        @state.following.push( TOKENS_FOLLOWING_termino_IN_exp_1454 )
        termino90 = termino
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, termino90.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action

                $next_operation = @vars_block_stack.last.auxiliar.operations_stack.look()
          			if (not $next_operation.nil?) && ($next_operation == '+' || $next_operation == '-')
          				@vars_block_stack.last.auxiliar.operations_stack.pop()
          				$oper2 = @vars_block_stack.last.auxiliar.operands_stack.look()
          				@vars_block_stack.last.auxiliar.operands_stack.pop()
          				$oper1 = @vars_block_stack.last.auxiliar.operands_stack.look()
          				@vars_block_stack.last.auxiliar.operands_stack.pop()
          				$resulting_type = @vars_block_stack.last.auxiliar.checkCuadruple($next_operation, $oper1, $oper2)
          				# In the future, use the nextTemporalVariable
          				$temp = 't' + @vars_block_stack.last.auxiliar.next_temp.to_s
          				@vars_block_stack.last.auxiliar.next_temp = @vars_block_stack.last.auxiliar.next_temp + 1
          				$destiny = { id: $temp, type: $resulting_type, value: nil }
          				$cuadruple = Cuadruples.new($next_operation, $oper1, $oper2, $destiny)
          				@vars_block_stack.last.auxiliar.lines_counter = @vars_block_stack.last.auxiliar.lines_counter + 1
          				@vars_block_stack.last.auxiliar.cuadruples_array << $cuadruple
          				@vars_block_stack.last.auxiliar.operands_stack.push( $destiny )
          			end
              
          # <-- action
        end
        @state.following.push( TOKENS_FOLLOWING_expaux_IN_exp_1468 )
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
    # (in Simple.g)
    # 311:1: expaux : ( | PLUS exp | MINUS exp );
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
        # at line 311:7: ( | PLUS exp | MINUS exp )
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


          # at line 312:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 312:7: PLUS exp
          __PLUS92__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expaux_1488 )
          if @state.backtracking == 0

            tree_for_PLUS92 = @adaptor.create_with_payload( __PLUS92__ )
            @adaptor.add_child( root_0, tree_for_PLUS92 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.auxiliar.operations_stack.push( __PLUS92__.text )
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_expaux_1496 )
          exp93 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp93.tree )
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 316:7: MINUS exp
          __MINUS94__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expaux_1505 )
          if @state.backtracking == 0

            tree_for_MINUS94 = @adaptor.create_with_payload( __MINUS94__ )
            @adaptor.add_child( root_0, tree_for_MINUS94 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.auxiliar.operations_stack.push( __MINUS94__.text )
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_expaux_1513 )
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
    # (in Simple.g)
    # 322:1: termino : factor terminoaux ;
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


        # at line 323:5: factor terminoaux
        @state.following.push( TOKENS_FOLLOWING_factor_IN_termino_1530 )
        factor96 = factor
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, factor96.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           
                $next_operation = @vars_block_stack.last.auxiliar.operations_stack.look()
                if (not $next_operation.nil?) && ($next_operation == '*' || $next_operation == '/')
          				@vars_block_stack.last.auxiliar.operations_stack.pop()
          				$oper2 = @vars_block_stack.last.auxiliar.operands_stack.look()
          				@vars_block_stack.last.auxiliar.operands_stack.pop()
          				$oper1 = @vars_block_stack.last.auxiliar.operands_stack.look()
          				@vars_block_stack.last.auxiliar.operands_stack.pop()
          				$resulting_type = @vars_block_stack.last.auxiliar.checkCuadruple($next_operation, $oper1, $oper2)
          				$temp = 't' + @vars_block_stack.last.auxiliar.next_temp.to_s
          				@vars_block_stack.last.auxiliar.next_temp = @vars_block_stack.last.auxiliar.next_temp + 1
          				$destiny = { id: $temp, type: $resulting_type, value: nil }
          				$cuadruple = Cuadruples.new($next_operation, $oper1, $oper2, $destiny)
          				@vars_block_stack.last.auxiliar.lines_counter = @vars_block_stack.last.auxiliar.lines_counter + 1
          				@vars_block_stack.last.auxiliar.cuadruples_array << $cuadruple
          				@vars_block_stack.last.auxiliar.operands_stack.push( $destiny )
          			end
              
          # <-- action
        end
        @state.following.push( TOKENS_FOLLOWING_terminoaux_IN_termino_1539 )
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
    # (in Simple.g)
    # 344:1: terminoaux : ( | TIMES termino | DIVIDE termino );
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
        # at line 344:11: ( | TIMES termino | DIVIDE termino )
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


          # at line 345:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 345:7: TIMES termino
          __TIMES98__ = match( TIMES, TOKENS_FOLLOWING_TIMES_IN_terminoaux_1559 )
          if @state.backtracking == 0

            tree_for_TIMES98 = @adaptor.create_with_payload( __TIMES98__ )
            @adaptor.add_child( root_0, tree_for_TIMES98 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.auxiliar.operations_stack.push( __TIMES98__.text )
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_termino_IN_terminoaux_1568 )
          termino99 = termino
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, termino99.tree )
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 349:7: DIVIDE termino
          __DIVIDE100__ = match( DIVIDE, TOKENS_FOLLOWING_DIVIDE_IN_terminoaux_1577 )
          if @state.backtracking == 0

            tree_for_DIVIDE100 = @adaptor.create_with_payload( __DIVIDE100__ )
            @adaptor.add_child( root_0, tree_for_DIVIDE100 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.auxiliar.operations_stack.push( __DIVIDE100__.text )
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_termino_IN_terminoaux_1585 )
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
    # (in Simple.g)
    # 356:1: factor : ( NOT notfactor | LPARENT exp RPARENT | varcte );
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
        # at line 356:7: ( NOT notfactor | LPARENT exp RPARENT | varcte )
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


          # at line 357:5: NOT notfactor
          __NOT102__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_factor_1604 )
          if @state.backtracking == 0

            tree_for_NOT102 = @adaptor.create_with_payload( __NOT102__ )
            @adaptor.add_child( root_0, tree_for_NOT102 )

          end
          @state.following.push( TOKENS_FOLLOWING_notfactor_IN_factor_1606 )
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


          # at line 358:7: LPARENT exp RPARENT
          __LPARENT104__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_factor_1616 )
          if @state.backtracking == 0

            tree_for_LPARENT104 = @adaptor.create_with_payload( __LPARENT104__ )
            @adaptor.add_child( root_0, tree_for_LPARENT104 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.auxiliar.operations_stack.push( __LPARENT104__.text )
                
            # <-- action
          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_factor_1620 )
          exp105 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp105.tree )
          end
          __RPARENT106__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_factor_1622 )
          if @state.backtracking == 0

            tree_for_RPARENT106 = @adaptor.create_with_payload( __RPARENT106__ )
            @adaptor.add_child( root_0, tree_for_RPARENT106 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  @vars_block_stack.last.auxiliar.operations_stack.pop()
                
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 364:7: varcte
          @state.following.push( TOKENS_FOLLOWING_varcte_IN_factor_1638 )
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
    # (in Simple.g)
    # 367:1: notfactor : ( LPARENT exp RPARENT | varcte );
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
        # at line 367:10: ( LPARENT exp RPARENT | varcte )
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


          # at line 368:5: LPARENT exp RPARENT
          __LPARENT108__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_notfactor_1654 )
          if @state.backtracking == 0

            tree_for_LPARENT108 = @adaptor.create_with_payload( __LPARENT108__ )
            @adaptor.add_child( root_0, tree_for_LPARENT108 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_notfactor_1656 )
          exp109 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp109.tree )
          end
          __RPARENT110__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_notfactor_1658 )
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


          # at line 369:7: varcte
          @state.following.push( TOKENS_FOLLOWING_varcte_IN_notfactor_1668 )
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
    # (in Simple.g)
    # 372:1: sign : ( PLUS | MINUS );
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
        # at line 372:5: ( PLUS | MINUS )
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


          # at line 373:5: PLUS
          __PLUS112__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_sign_1686 )
          if @state.backtracking == 0

            tree_for_PLUS112 = @adaptor.create_with_payload( __PLUS112__ )
            @adaptor.add_child( root_0, tree_for_PLUS112 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

            	@vars_block_stack.last.auxiliar.sign_variable = __PLUS112__.text
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 376:7: MINUS
          __MINUS113__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_sign_1696 )
          if @state.backtracking == 0

            tree_for_MINUS113 = @adaptor.create_with_payload( __MINUS113__ )
            @adaptor.add_child( root_0, tree_for_MINUS113 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

            	@vars_block_stack.last.auxiliar.sign_variable = __MINUS113__.text
                
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
    # (in Simple.g)
    # 381:1: varcte : ( ID idvarcte | CTEI | CTEF | CTES | CTEB );
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
        # at line 381:7: ( ID idvarcte | CTEI | CTEF | CTES | CTEB )
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


          # at line 382:5: ID idvarcte
          __ID114__ = match( ID, TOKENS_FOLLOWING_ID_IN_varcte_1714 )
          if @state.backtracking == 0

            tree_for_ID114 = @adaptor.create_with_payload( __ID114__ )
            @adaptor.add_child( root_0, tree_for_ID114 )

          end
          @state.following.push( TOKENS_FOLLOWING_idvarcte_IN_varcte_1716 )
          idvarcte115 = idvarcte
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, idvarcte115.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  $id = __ID114__.text
            			$var = @vars_block_stack.last.auxiliar.findVariable($id)
            			if not @vars_block_stack.last.auxiliar.sign_variable.nil?
            				if $var[:type] == 'string'
            					abort("\nERROR: Cannot apply #{@vars_block_stack.last.auxiliar.sign_variable} to string #{$var[:id]}\n")
            				elsif $var[:type] == 'boolean'
            					abort("\nERRO: Cannot apply #{@vars_block_stack.last.auxiliar.sign_variable} to boolean #{$var[:id]}\n")
            				elsif @vars_block_stack.last.auxiliar.sign_variable == '-'
            					$var[:value] = - $var[:value]
            					@vars_block_stack.last.auxiliar.sign_variable = nil
            				end
            			end
            			@vars_block_stack.last.auxiliar.operands_stack.push( $var )
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 397:7: CTEI
          __CTEI116__ = match( CTEI, TOKENS_FOLLOWING_CTEI_IN_varcte_1726 )
          if @state.backtracking == 0

            tree_for_CTEI116 = @adaptor.create_with_payload( __CTEI116__ )
            @adaptor.add_child( root_0, tree_for_CTEI116 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  $var = { id: nil, type: 'int', value: __CTEI116__.text.to_i }
                  @vars_block_stack.last.auxiliar.operands_stack.push( $var )
                
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 401:7: CTEF
          __CTEF117__ = match( CTEF, TOKENS_FOLLOWING_CTEF_IN_varcte_1736 )
          if @state.backtracking == 0

            tree_for_CTEF117 = @adaptor.create_with_payload( __CTEF117__ )
            @adaptor.add_child( root_0, tree_for_CTEF117 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                  $var = { id: nil, type: 'float', value: __CTEF117__.text.to_f }
                  @vars_block_stack.last.auxiliar.operands_stack.push( $var )
                
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 405:7: CTES
          __CTES118__ = match( CTES, TOKENS_FOLLOWING_CTES_IN_varcte_1746 )
          if @state.backtracking == 0

            tree_for_CTES118 = @adaptor.create_with_payload( __CTES118__ )
            @adaptor.add_child( root_0, tree_for_CTES118 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
                  if not @vars_block_stack.last.auxiliar.sign_variable.nil?
            	abort("\nERROR: You cannot apply '+' or '-' to the string #{__CTES118__.text}\n")
                  end
                  @vars_block_stack.last.auxiliar.operands_stack.push({ id: nil, type: 'string', value: __CTES118__.text })
                
            # <-- action
          end

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 411:7: CTEB
          __CTEB119__ = match( CTEB, TOKENS_FOLLOWING_CTEB_IN_varcte_1756 )
          if @state.backtracking == 0

            tree_for_CTEB119 = @adaptor.create_with_payload( __CTEB119__ )
            @adaptor.add_child( root_0, tree_for_CTEB119 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
                  if not @vars_block_stack.last.auxiliar.sign_variable.nil?
            	abort("\nERROR: You cannot apply '+' or '-' to boolean\n")
                  end
                  @vars_block_stack.last.auxiliar.operands_stack.push({ id: nil, type: 'boolean', value: __CTEB119__.text == 'true' })
                
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
    # (in Simple.g)
    # 419:1: idvarcte : ( | llamada | array );
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
        # at line 419:9: ( | llamada | array )
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


          # at line 420:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 420:7: llamada
          @state.following.push( TOKENS_FOLLOWING_llamada_IN_idvarcte_1778 )
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


          # at line 421:7: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_idvarcte_1788 )
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
    # (in Simple.g)
    # 424:1: comparacion : ( LT | LE | GT | GE | EQ | NE );
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
        # at line 424:12: ( LT | LE | GT | GE | EQ | NE )
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


          # at line 425:5: LT
          __LT122__ = match( LT, TOKENS_FOLLOWING_LT_IN_comparacion_1806 )
          if @state.backtracking == 0

            tree_for_LT122 = @adaptor.create_with_payload( __LT122__ )
            @adaptor.add_child( root_0, tree_for_LT122 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            	@vars_block_stack.last.auxiliar.operations_stack.push( __LT122__.text )
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 428:7: LE
          __LE123__ = match( LE, TOKENS_FOLLOWING_LE_IN_comparacion_1816 )
          if @state.backtracking == 0

            tree_for_LE123 = @adaptor.create_with_payload( __LE123__ )
            @adaptor.add_child( root_0, tree_for_LE123 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            	@vars_block_stack.last.auxiliar.operations_stack.push( __LE123__.text )
                
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 431:7: GT
          __GT124__ = match( GT, TOKENS_FOLLOWING_GT_IN_comparacion_1826 )
          if @state.backtracking == 0

            tree_for_GT124 = @adaptor.create_with_payload( __GT124__ )
            @adaptor.add_child( root_0, tree_for_GT124 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            	@vars_block_stack.last.auxiliar.operations_stack.push( __GT124__.text )
                
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 434:7: GE
          __GE125__ = match( GE, TOKENS_FOLLOWING_GE_IN_comparacion_1836 )
          if @state.backtracking == 0

            tree_for_GE125 = @adaptor.create_with_payload( __GE125__ )
            @adaptor.add_child( root_0, tree_for_GE125 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

            	@vars_block_stack.last.auxiliar.operations_stack.push( __GE125__.text )
                
            # <-- action
          end

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 437:7: EQ
          __EQ126__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_comparacion_1846 )
          if @state.backtracking == 0

            tree_for_EQ126 = @adaptor.create_with_payload( __EQ126__ )
            @adaptor.add_child( root_0, tree_for_EQ126 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

            	@vars_block_stack.last.auxiliar.operations_stack.push( __EQ126__.text )
                
            # <-- action
          end

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 440:7: NE
          __NE127__ = match( NE, TOKENS_FOLLOWING_NE_IN_comparacion_1856 )
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
    # (in Simple.g)
    # 443:1: logico : ( AND | OR );
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
        # at line 443:7: ( AND | OR )
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


          # at line 444:5: AND
          __AND128__ = match( AND, TOKENS_FOLLOWING_AND_IN_logico_1874 )
          if @state.backtracking == 0

            tree_for_AND128 = @adaptor.create_with_payload( __AND128__ )
            @adaptor.add_child( root_0, tree_for_AND128 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

            	@vars_block_stack.last.auxiliar.operations_stack.push( __AND128__.text )
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 447:7: OR
          __OR129__ = match( OR, TOKENS_FOLLOWING_OR_IN_logico_1884 )
          if @state.backtracking == 0

            tree_for_OR129 = @adaptor.create_with_payload( __OR129__ )
            @adaptor.add_child( root_0, tree_for_OR129 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
            	@vars_block_stack.last.auxiliar.operations_stack.push( __OR129__.text )
                
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
    # (in Simple.g)
    # 452:1: retorno : ( | exp );
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
        # at line 452:8: ( | exp )
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


          # at line 453:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 453:7: exp
          @state.following.push( TOKENS_FOLLOWING_exp_IN_retorno_1906 )
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
    # (in Simple.g)
    # 456:1: condicion : IF LPARENT expresion RPARENT LBRACK est RBRACK elsecondicion ;
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


        # at line 457:5: IF LPARENT expresion RPARENT LBRACK est RBRACK elsecondicion
        __IF131__ = match( IF, TOKENS_FOLLOWING_IF_IN_condicion_1924 )
        if @state.backtracking == 0

          tree_for_IF131 = @adaptor.create_with_payload( __IF131__ )
          @adaptor.add_child( root_0, tree_for_IF131 )

        end
        __LPARENT132__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_condicion_1926 )
        if @state.backtracking == 0

          tree_for_LPARENT132 = @adaptor.create_with_payload( __LPARENT132__ )
          @adaptor.add_child( root_0, tree_for_LPARENT132 )

        end
        @state.following.push( TOKENS_FOLLOWING_expresion_IN_condicion_1928 )
        expresion133 = expresion
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expresion133.tree )
        end
        __RPARENT134__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_condicion_1930 )
        if @state.backtracking == 0

          tree_for_RPARENT134 = @adaptor.create_with_payload( __RPARENT134__ )
          @adaptor.add_child( root_0, tree_for_RPARENT134 )

        end
        __LBRACK135__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_condicion_1932 )
        if @state.backtracking == 0

          tree_for_LBRACK135 = @adaptor.create_with_payload( __LBRACK135__ )
          @adaptor.add_child( root_0, tree_for_LBRACK135 )

        end
        @state.following.push( TOKENS_FOLLOWING_est_IN_condicion_1934 )
        est136 = est
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, est136.tree )
        end
        __RBRACK137__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_condicion_1936 )
        if @state.backtracking == 0

          tree_for_RBRACK137 = @adaptor.create_with_payload( __RBRACK137__ )
          @adaptor.add_child( root_0, tree_for_RBRACK137 )

        end
        @state.following.push( TOKENS_FOLLOWING_elsecondicion_IN_condicion_1938 )
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
    # (in Simple.g)
    # 460:1: elsecondicion : ( | ELSE LBRACK est RBRACK );
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
        # at line 460:14: ( | ELSE LBRACK est RBRACK )
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


          # at line 461:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 461:7: ELSE LBRACK est RBRACK
          __ELSE139__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_elsecondicion_1960 )
          if @state.backtracking == 0

            tree_for_ELSE139 = @adaptor.create_with_payload( __ELSE139__ )
            @adaptor.add_child( root_0, tree_for_ELSE139 )

          end
          __LBRACK140__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_elsecondicion_1962 )
          if @state.backtracking == 0

            tree_for_LBRACK140 = @adaptor.create_with_payload( __LBRACK140__ )
            @adaptor.add_child( root_0, tree_for_LBRACK140 )

          end
          @state.following.push( TOKENS_FOLLOWING_est_IN_elsecondicion_1964 )
          est141 = est
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, est141.tree )
          end
          __RBRACK142__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_elsecondicion_1966 )
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
    # (in Simple.g)
    # 464:1: escritura : PRINT LPARENT argsescritura RPARENT SEMICOLON ;
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


        # at line 465:5: PRINT LPARENT argsescritura RPARENT SEMICOLON
        __PRINT143__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_escritura_1984 )
        if @state.backtracking == 0

          tree_for_PRINT143 = @adaptor.create_with_payload( __PRINT143__ )
          @adaptor.add_child( root_0, tree_for_PRINT143 )

        end
        __LPARENT144__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_escritura_1986 )
        if @state.backtracking == 0

          tree_for_LPARENT144 = @adaptor.create_with_payload( __LPARENT144__ )
          @adaptor.add_child( root_0, tree_for_LPARENT144 )

        end
        @state.following.push( TOKENS_FOLLOWING_argsescritura_IN_escritura_1988 )
        argsescritura145 = argsescritura
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, argsescritura145.tree )
        end
        __RPARENT146__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_escritura_1990 )
        if @state.backtracking == 0

          tree_for_RPARENT146 = @adaptor.create_with_payload( __RPARENT146__ )
          @adaptor.add_child( root_0, tree_for_RPARENT146 )

        end
        __SEMICOLON147__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_escritura_1992 )
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
    # (in Simple.g)
    # 468:1: argsescritura : exp argsescrituraaux ;
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


        # at line 469:5: exp argsescrituraaux
        @state.following.push( TOKENS_FOLLOWING_exp_IN_argsescritura_2010 )
        exp148 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp148.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_argsescrituraaux_IN_argsescritura_2012 )
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
    # (in Simple.g)
    # 472:1: argsescrituraaux : ( | COMMA argsescritura );
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
        # at line 472:17: ( | COMMA argsescritura )
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


          # at line 473:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 473:7: COMMA argsescritura
          __COMMA150__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsescrituraaux_2034 )
          if @state.backtracking == 0

            tree_for_COMMA150 = @adaptor.create_with_payload( __COMMA150__ )
            @adaptor.add_child( root_0, tree_for_COMMA150 )

          end
          @state.following.push( TOKENS_FOLLOWING_argsescritura_IN_argsescrituraaux_2036 )
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
    # (in Simple.g)
    # 476:1: ciclo : FOR LPARENT cicloaux SEMICOLON expresion SEMICOLON cicloaux RPARENT LBRACK est RBRACK ;
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


        # at line 477:5: FOR LPARENT cicloaux SEMICOLON expresion SEMICOLON cicloaux RPARENT LBRACK est RBRACK
        __FOR152__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_ciclo_2054 )
        if @state.backtracking == 0

          tree_for_FOR152 = @adaptor.create_with_payload( __FOR152__ )
          @adaptor.add_child( root_0, tree_for_FOR152 )

        end
        __LPARENT153__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_ciclo_2056 )
        if @state.backtracking == 0

          tree_for_LPARENT153 = @adaptor.create_with_payload( __LPARENT153__ )
          @adaptor.add_child( root_0, tree_for_LPARENT153 )

        end
        @state.following.push( TOKENS_FOLLOWING_cicloaux_IN_ciclo_2058 )
        cicloaux154 = cicloaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, cicloaux154.tree )
        end
        __SEMICOLON155__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_ciclo_2060 )
        if @state.backtracking == 0

          tree_for_SEMICOLON155 = @adaptor.create_with_payload( __SEMICOLON155__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON155 )

        end
        @state.following.push( TOKENS_FOLLOWING_expresion_IN_ciclo_2062 )
        expresion156 = expresion
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expresion156.tree )
        end
        __SEMICOLON157__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_ciclo_2064 )
        if @state.backtracking == 0

          tree_for_SEMICOLON157 = @adaptor.create_with_payload( __SEMICOLON157__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON157 )

        end
        @state.following.push( TOKENS_FOLLOWING_cicloaux_IN_ciclo_2066 )
        cicloaux158 = cicloaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, cicloaux158.tree )
        end
        __RPARENT159__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_ciclo_2068 )
        if @state.backtracking == 0

          tree_for_RPARENT159 = @adaptor.create_with_payload( __RPARENT159__ )
          @adaptor.add_child( root_0, tree_for_RPARENT159 )

        end
        __LBRACK160__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_ciclo_2070 )
        if @state.backtracking == 0

          tree_for_LBRACK160 = @adaptor.create_with_payload( __LBRACK160__ )
          @adaptor.add_child( root_0, tree_for_LBRACK160 )

        end
        @state.following.push( TOKENS_FOLLOWING_est_IN_ciclo_2072 )
        est161 = est
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, est161.tree )
        end
        __RBRACK162__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_ciclo_2074 )
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
    # (in Simple.g)
    # 480:1: cicloaux : ( | ID cicloauxx ASSIGN exp );
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
        # at line 480:9: ( | ID cicloauxx ASSIGN exp )
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


          # at line 481:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 481:7: ID cicloauxx ASSIGN exp
          __ID163__ = match( ID, TOKENS_FOLLOWING_ID_IN_cicloaux_2096 )
          if @state.backtracking == 0

            tree_for_ID163 = @adaptor.create_with_payload( __ID163__ )
            @adaptor.add_child( root_0, tree_for_ID163 )

          end
          @state.following.push( TOKENS_FOLLOWING_cicloauxx_IN_cicloaux_2098 )
          cicloauxx164 = cicloauxx
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, cicloauxx164.tree )
          end
          __ASSIGN165__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_cicloaux_2100 )
          if @state.backtracking == 0

            tree_for_ASSIGN165 = @adaptor.create_with_payload( __ASSIGN165__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN165 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_cicloaux_2102 )
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
    # (in Simple.g)
    # 484:1: cicloauxx : ( | array );
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
        # at line 484:10: ( | array )
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


          # at line 485:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 485:7: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_cicloauxx_2124 )
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
    # (in Simple.g)
    # 488:1: lectura : INPUT LPARENT tipo COMMA ID RPARENT SEMICOLON ;
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


        # at line 489:5: INPUT LPARENT tipo COMMA ID RPARENT SEMICOLON
        __INPUT168__ = match( INPUT, TOKENS_FOLLOWING_INPUT_IN_lectura_2142 )
        if @state.backtracking == 0

          tree_for_INPUT168 = @adaptor.create_with_payload( __INPUT168__ )
          @adaptor.add_child( root_0, tree_for_INPUT168 )

        end
        __LPARENT169__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_lectura_2144 )
        if @state.backtracking == 0

          tree_for_LPARENT169 = @adaptor.create_with_payload( __LPARENT169__ )
          @adaptor.add_child( root_0, tree_for_LPARENT169 )

        end
        @state.following.push( TOKENS_FOLLOWING_tipo_IN_lectura_2146 )
        tipo170 = tipo
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, tipo170.tree )
        end
        __COMMA171__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_lectura_2148 )
        if @state.backtracking == 0

          tree_for_COMMA171 = @adaptor.create_with_payload( __COMMA171__ )
          @adaptor.add_child( root_0, tree_for_COMMA171 )

        end
        __ID172__ = match( ID, TOKENS_FOLLOWING_ID_IN_lectura_2150 )
        if @state.backtracking == 0

          tree_for_ID172 = @adaptor.create_with_payload( __ID172__ )
          @adaptor.add_child( root_0, tree_for_ID172 )

        end
        __RPARENT173__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_lectura_2152 )
        if @state.backtracking == 0

          tree_for_RPARENT173 = @adaptor.create_with_payload( __RPARENT173__ )
          @adaptor.add_child( root_0, tree_for_RPARENT173 )

        end
        __SEMICOLON174__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_lectura_2154 )
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
    # (in Simple.g)
    # 492:1: main : MAIN LPARENT RPARENT LBRACK var est RBRACK ;
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


        # at line 493:5: MAIN LPARENT RPARENT LBRACK var est RBRACK
        __MAIN175__ = match( MAIN, TOKENS_FOLLOWING_MAIN_IN_main_2172 )
        if @state.backtracking == 0

          tree_for_MAIN175 = @adaptor.create_with_payload( __MAIN175__ )
          @adaptor.add_child( root_0, tree_for_MAIN175 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           
          			@vars_block_stack.last.auxiliar.scope_location = __MAIN175__.text 
          			if not @vars_block_stack.last.auxiliar.procedures.has_key?(@vars_block_stack.last.auxiliar.scope_location)
          				@vars_block_stack.last.auxiliar.addProcedure(nil, 'void')
          			else
          				abort("\nERROR: The program can only have one main procedure\n")
          			end
              
          # <-- action
        end
        __LPARENT176__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_main_2176 )
        if @state.backtracking == 0

          tree_for_LPARENT176 = @adaptor.create_with_payload( __LPARENT176__ )
          @adaptor.add_child( root_0, tree_for_LPARENT176 )

        end
        __RPARENT177__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_main_2178 )
        if @state.backtracking == 0

          tree_for_RPARENT177 = @adaptor.create_with_payload( __RPARENT177__ )
          @adaptor.add_child( root_0, tree_for_RPARENT177 )

        end
        __LBRACK178__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_main_2180 )
        if @state.backtracking == 0

          tree_for_LBRACK178 = @adaptor.create_with_payload( __LBRACK178__ )
          @adaptor.add_child( root_0, tree_for_LBRACK178 )

        end
        @state.following.push( TOKENS_FOLLOWING_var_IN_main_2182 )
        var179 = var
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, var179.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_est_IN_main_2184 )
        est180 = est
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, est180.tree )
        end
        __RBRACK181__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_main_2186 )
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
    # (in Simple.g)
    # 159:5: synpred6_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred6_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )

      # at line 159:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 53 )

    end
    # 
    # syntactic predicate synpred7_Simple
    # 
    # (in Simple.g)
    # 160:5: synpred7_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred7_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )

      # at line 160:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )

    end
    # 
    # syntactic predicate synpred8_Simple
    # 
    # (in Simple.g)
    # 164:5: synpred8_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred8_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )

      # at line 164:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 55 )

    end
    # 
    # syntactic predicate synpred9_Simple
    # 
    # (in Simple.g)
    # 165:5: synpred9_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred9_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )

      # at line 165:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 56 )

    end
    # 
    # syntactic predicate synpred10_Simple
    # 
    # (in Simple.g)
    # 169:5: synpred10_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred10_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )

      # at line 169:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 57 )

    end
    # 
    # syntactic predicate synpred11_Simple
    # 
    # (in Simple.g)
    # 170:5: synpred11_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred11_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 58 )

      # at line 170:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 58 )

    end
    # 
    # syntactic predicate synpred12_Simple
    # 
    # (in Simple.g)
    # 174:5: synpred12_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred12_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 59 )

      # at line 174:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 59 )

    end
    # 
    # syntactic predicate synpred13_Simple
    # 
    # (in Simple.g)
    # 175:5: synpred13_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred13_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 60 )

      # at line 175:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 60 )

    end
    # 
    # syntactic predicate synpred17_Simple
    # 
    # (in Simple.g)
    # 186:5: synpred17_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred17_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 64 )

      # at line 186:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 64 )

    end
    # 
    # syntactic predicate synpred18_Simple
    # 
    # (in Simple.g)
    # 187:5: synpred18_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred18_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 65 )

      # at line 187:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 65 )

    end


    TOKENS_FOLLOWING_programa_IN_vars_block_589 = Set[ 1 ]
    TOKENS_FOLLOWING_var_IN_programa_605 = Set[ 9, 11 ]
    TOKENS_FOLLOWING_func_IN_programa_607 = Set[ 9, 11 ]
    TOKENS_FOLLOWING_main_IN_programa_609 = Set[ 1 ]
    TOKENS_FOLLOWING_variables_IN_var_627 = Set[ 4, 5, 6, 7, 8 ]
    TOKENS_FOLLOWING_var_IN_var_629 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_variables_645 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_647 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_assignint_IN_variables_651 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_653 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_variables_663 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_665 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_assignfloat_IN_variables_669 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_671 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_variables_681 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_683 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_assignstring_IN_variables_687 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_689 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_variables_699 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_701 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_assignboolean_IN_variables_705 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_707 = Set[ 1 ]
    TOKENS_FOLLOWING_ARRAY_IN_variables_717 = Set[ 4, 5, 6, 7 ]
    TOKENS_FOLLOWING_tipo_IN_variables_721 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_723 = Set[ 37 ]
    TOKENS_FOLLOWING_COLON_IN_variables_725 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_variables_727 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_729 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignint_762 = Set[ 43 ]
    TOKENS_FOLLOWING_CTEI_IN_assignint_764 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignfloat_795 = Set[ 44 ]
    TOKENS_FOLLOWING_CTEF_IN_assignfloat_797 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignstring_829 = Set[ 46 ]
    TOKENS_FOLLOWING_CTES_IN_assignstring_831 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignboolean_862 = Set[ 47 ]
    TOKENS_FOLLOWING_CTEB_IN_assignboolean_864 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_tipo_887 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_tipo_897 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_tipo_907 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_tipo_917 = Set[ 1 ]
    TOKENS_FOLLOWING_funcion_IN_func_945 = Set[ 11 ]
    TOKENS_FOLLOWING_func_IN_func_947 = Set[ 1 ]
    TOKENS_FOLLOWING_FUNCTION_IN_funcion_965 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_funcion_967 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_funcion_971 = Set[ 4, 5, 6, 7, 31 ]
    TOKENS_FOLLOWING_argumentos_IN_funcion_975 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_funcion_977 = Set[ 37 ]
    TOKENS_FOLLOWING_COLON_IN_funcion_979 = Set[ 4, 5, 6, 7, 10 ]
    TOKENS_FOLLOWING_retornofunc_IN_funcion_983 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_funcion_987 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_var_IN_funcion_989 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_funcion_991 = Set[ 12 ]
    TOKENS_FOLLOWING_RETURN_IN_funcion_993 = Set[ 25, 30, 36, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_retorno_IN_funcion_995 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_funcion_997 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_funcion_999 = Set[ 1 ]
    TOKENS_FOLLOWING_tipo_IN_argumentos_1026 = Set[ 35, 49 ]
    TOKENS_FOLLOWING_ref_IN_argumentos_1028 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_argumentos_1030 = Set[ 34 ]
    TOKENS_FOLLOWING_argumentoaux_IN_argumentos_1034 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argumentoaux_1059 = Set[ 4, 5, 6, 7 ]
    TOKENS_FOLLOWING_tipo_IN_argumentoaux_1063 = Set[ 35, 49 ]
    TOKENS_FOLLOWING_ref_IN_argumentoaux_1065 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_argumentoaux_1067 = Set[ 34 ]
    TOKENS_FOLLOWING_argumentoaux_IN_argumentoaux_1071 = Set[ 1 ]
    TOKENS_FOLLOWING_REF_IN_ref_1093 = Set[ 1 ]
    TOKENS_FOLLOWING_VOID_IN_retornofunc_1114 = Set[ 1 ]
    TOKENS_FOLLOWING_tipo_IN_retornofunc_1126 = Set[ 1 ]
    TOKENS_FOLLOWING_estatutos_IN_est_1144 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_estaux_IN_est_1146 = Set[ 1 ]
    TOKENS_FOLLOWING_estatutos_IN_estaux_1168 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_estaux_IN_estaux_1170 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_estatutos_1188 = Set[ 18, 30, 32 ]
    TOKENS_FOLLOWING_idestatutos_IN_estatutos_1192 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_estatutos_1194 = Set[ 1 ]
    TOKENS_FOLLOWING_condicion_IN_estatutos_1204 = Set[ 1 ]
    TOKENS_FOLLOWING_escritura_IN_estatutos_1214 = Set[ 1 ]
    TOKENS_FOLLOWING_ciclo_IN_estatutos_1224 = Set[ 1 ]
    TOKENS_FOLLOWING_lectura_IN_estatutos_1234 = Set[ 1 ]
    TOKENS_FOLLOWING_llamada_IN_idestatutos_1252 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_idestatutos_1262 = Set[ 18 ]
    TOKENS_FOLLOWING_ASSIGN_IN_idestatutos_1264 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_idestatutos_1266 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_idestatutos_1276 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_idestatutos_1284 = Set[ 1 ]
    TOKENS_FOLLOWING_LPARENT_IN_llamada_1301 = Set[ 25, 30, 31, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_llamadaargs_IN_llamada_1303 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_llamada_1305 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_llamadaargs_1327 = Set[ 34 ]
    TOKENS_FOLLOWING_llamadaargsaux_IN_llamadaargs_1329 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_llamadaargsaux_1351 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_llamadaargsaux_1353 = Set[ 34 ]
    TOKENS_FOLLOWING_llamadaargsaux_IN_llamadaargsaux_1355 = Set[ 1 ]
    TOKENS_FOLLOWING_LSBRACK_IN_array_1373 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_array_1375 = Set[ 33 ]
    TOKENS_FOLLOWING_RSBRACK_IN_array_1377 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_expresion_1395 = Set[ 1 ]
    TOKENS_FOLLOWING_comparacion_IN_expresionaux_1421 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_expresionaux_1423 = Set[ 1 ]
    TOKENS_FOLLOWING_logico_IN_expresionaux_1434 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_expresionaux_1436 = Set[ 1 ]
    TOKENS_FOLLOWING_termino_IN_exp_1454 = Set[ 38, 39 ]
    TOKENS_FOLLOWING_expaux_IN_exp_1468 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_expaux_1488 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_expaux_1496 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expaux_1505 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_expaux_1513 = Set[ 1 ]
    TOKENS_FOLLOWING_factor_IN_termino_1530 = Set[ 40, 41 ]
    TOKENS_FOLLOWING_terminoaux_IN_termino_1539 = Set[ 1 ]
    TOKENS_FOLLOWING_TIMES_IN_terminoaux_1559 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_termino_IN_terminoaux_1568 = Set[ 1 ]
    TOKENS_FOLLOWING_DIVIDE_IN_terminoaux_1577 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_termino_IN_terminoaux_1585 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_factor_1604 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_notfactor_IN_factor_1606 = Set[ 1 ]
    TOKENS_FOLLOWING_LPARENT_IN_factor_1616 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_factor_1620 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_factor_1622 = Set[ 1 ]
    TOKENS_FOLLOWING_varcte_IN_factor_1638 = Set[ 1 ]
    TOKENS_FOLLOWING_LPARENT_IN_notfactor_1654 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_notfactor_1656 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_notfactor_1658 = Set[ 1 ]
    TOKENS_FOLLOWING_varcte_IN_notfactor_1668 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_sign_1686 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_sign_1696 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_varcte_1714 = Set[ 30, 32 ]
    TOKENS_FOLLOWING_idvarcte_IN_varcte_1716 = Set[ 1 ]
    TOKENS_FOLLOWING_CTEI_IN_varcte_1726 = Set[ 1 ]
    TOKENS_FOLLOWING_CTEF_IN_varcte_1736 = Set[ 1 ]
    TOKENS_FOLLOWING_CTES_IN_varcte_1746 = Set[ 1 ]
    TOKENS_FOLLOWING_CTEB_IN_varcte_1756 = Set[ 1 ]
    TOKENS_FOLLOWING_llamada_IN_idvarcte_1778 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_idvarcte_1788 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_comparacion_1806 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_comparacion_1816 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_comparacion_1826 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_comparacion_1836 = Set[ 1 ]
    TOKENS_FOLLOWING_EQ_IN_comparacion_1846 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_comparacion_1856 = Set[ 1 ]
    TOKENS_FOLLOWING_AND_IN_logico_1874 = Set[ 1 ]
    TOKENS_FOLLOWING_OR_IN_logico_1884 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_retorno_1906 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_condicion_1924 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_condicion_1926 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_condicion_1928 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_condicion_1930 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_condicion_1932 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_condicion_1934 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_condicion_1936 = Set[ 15 ]
    TOKENS_FOLLOWING_elsecondicion_IN_condicion_1938 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_elsecondicion_1960 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_elsecondicion_1962 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_elsecondicion_1964 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_elsecondicion_1966 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_escritura_1984 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_escritura_1986 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_argsescritura_IN_escritura_1988 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_escritura_1990 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_escritura_1992 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_argsescritura_2010 = Set[ 34 ]
    TOKENS_FOLLOWING_argsescrituraaux_IN_argsescritura_2012 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsescrituraaux_2034 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_argsescritura_IN_argsescrituraaux_2036 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_ciclo_2054 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_ciclo_2056 = Set[ 36, 49 ]
    TOKENS_FOLLOWING_cicloaux_IN_ciclo_2058 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_ciclo_2060 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_ciclo_2062 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_ciclo_2064 = Set[ 31, 49 ]
    TOKENS_FOLLOWING_cicloaux_IN_ciclo_2066 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_ciclo_2068 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_ciclo_2070 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_ciclo_2072 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_ciclo_2074 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_cicloaux_2096 = Set[ 18, 32 ]
    TOKENS_FOLLOWING_cicloauxx_IN_cicloaux_2098 = Set[ 18 ]
    TOKENS_FOLLOWING_ASSIGN_IN_cicloaux_2100 = Set[ 25, 30, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_cicloaux_2102 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_cicloauxx_2124 = Set[ 1 ]
    TOKENS_FOLLOWING_INPUT_IN_lectura_2142 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_lectura_2144 = Set[ 4, 5, 6, 7 ]
    TOKENS_FOLLOWING_tipo_IN_lectura_2146 = Set[ 34 ]
    TOKENS_FOLLOWING_COMMA_IN_lectura_2148 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_lectura_2150 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_lectura_2152 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_lectura_2154 = Set[ 1 ]
    TOKENS_FOLLOWING_MAIN_IN_main_2172 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_main_2176 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_main_2178 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_main_2180 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_var_IN_main_2182 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_main_2184 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_main_2186 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

