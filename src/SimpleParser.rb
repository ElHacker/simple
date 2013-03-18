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

# - - - - - - begin action @parser::header - - - - - -
# Simple.g


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
                     :cicloauxx, :lectura, :main, :synpred1_Simple, :synpred2_Simple, 
                     :synpred7_Simple, :synpred8_Simple, :synpred9_Simple, 
                     :synpred10_Simple, :synpred11_Simple, :synpred12_Simple, 
                     :synpred13_Simple, :synpred14_Simple, :synpred18_Simple, 
                     :synpred19_Simple ].freeze

    @@vars_block = Scope( "global", "procedures", "operands_stack", "operations_stack", "jumps_stack", "lines_counter", "cuadruples_array", "scope_location" )


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


      begin
        root_0 = @adaptor.create_flat_list


        # at line 131:5: programa
        @state.following.push( TOKENS_FOLLOWING_programa_IN_vars_block_585 )
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

            puts("\n\nVariables in the expressions: \n")
            puts @vars_block_stack.last.operands_stack.to_str

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
    # 135:1: programa : global= var procedures= func main ;
    # 
    def programa
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      return_value = ProgramaReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      global = nil
      procedures = nil
      main2 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 136:5: global= var procedures= func main
        @state.following.push( TOKENS_FOLLOWING_var_IN_programa_602 )
        global = var
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, global.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_func_IN_programa_606 )
        procedures = func
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, procedures.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_main_IN_programa_608 )
        main2 = main
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, main2.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action

                    ( global.nil? ? nil : global.vars_array ).each do | var_info |
                      unless var_info.nil?
                        if @vars_block_stack.last.global.has_key?(var_info[:id])
                          print("\nERROR: Variable #{var_info[:id]} already defined in global\n")
                        else
                          @vars_block_stack.last.global[var_info[:id]] = var_info
                        end
                      end
                    end
                    ( procedures.nil? ? nil : procedures.list ).each do | proc_info |
                      unless proc_info.nil?
                        if @vars_block_stack.last.procedures.has_key?(proc_info[:id])
                          print("\nERROR: Function #{proc_info[:id]}  already defined\n")
                        else
                          @vars_block_stack.last.procedures[proc_info[:id]] = proc_info
                        end
                      end
                    end
                 
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
        # trace_out( __method__, 2 )

      end
      
      return return_value
    end

    VarReturnValue = define_return_scope :vars_array

    # 
    # parser rule var
    # 
    # (in Simple.g)
    # 158:1: var returns [vars_array] : ( | | single_var= variables vars= var );
    # 
    def var
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      return_value = VarReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      single_var = nil
      vars = nil


      begin
        # at line 158:24: ( | | single_var= variables vars= var )
        alt_1 = 3
        alt_1 = @dfa1.predict( @input )
        case alt_1
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 159:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 160:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 160:7: single_var= variables vars= var
          @state.following.push( TOKENS_FOLLOWING_variables_IN_var_641 )
          single_var = variables
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, single_var.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_var_IN_var_645 )
          vars = var
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, vars.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
                    return_value.vars_array = [single_var.var_info]
                    return_value.vars_array.concat(vars.vars_array) unless vars.vars_array.nil?
                  
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
        # trace_out( __method__, 3 )

      end
      
      return return_value
    end

    VariablesReturnValue = define_return_scope :var_info

    # 
    # parser rule variables
    # 
    # (in Simple.g)
    # 166:1: variables returns [var_info] : ( INT ID as_int= assignint SEMICOLON | FLOAT ID as_float= assignfloat SEMICOLON | STRING ID as_string= assignstring SEMICOLON | BOOLEAN ID as_boolean= assignboolean SEMICOLON | ARRAY data_type= tipo ID COLON exp SEMICOLON );
    # 
    def variables
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      return_value = VariablesReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __INT3__ = nil
      __ID4__ = nil
      __SEMICOLON5__ = nil
      __FLOAT6__ = nil
      __ID7__ = nil
      __SEMICOLON8__ = nil
      __STRING9__ = nil
      __ID10__ = nil
      __SEMICOLON11__ = nil
      __BOOLEAN12__ = nil
      __ID13__ = nil
      __SEMICOLON14__ = nil
      __ARRAY15__ = nil
      __ID16__ = nil
      __COLON17__ = nil
      __SEMICOLON19__ = nil
      as_int = nil
      as_float = nil
      as_string = nil
      as_boolean = nil
      data_type = nil
      exp18 = nil

      tree_for_INT3 = nil
      tree_for_ID4 = nil
      tree_for_SEMICOLON5 = nil
      tree_for_FLOAT6 = nil
      tree_for_ID7 = nil
      tree_for_SEMICOLON8 = nil
      tree_for_STRING9 = nil
      tree_for_ID10 = nil
      tree_for_SEMICOLON11 = nil
      tree_for_BOOLEAN12 = nil
      tree_for_ID13 = nil
      tree_for_SEMICOLON14 = nil
      tree_for_ARRAY15 = nil
      tree_for_ID16 = nil
      tree_for_COLON17 = nil
      tree_for_SEMICOLON19 = nil

      begin
        # at line 166:28: ( INT ID as_int= assignint SEMICOLON | FLOAT ID as_float= assignfloat SEMICOLON | STRING ID as_string= assignstring SEMICOLON | BOOLEAN ID as_boolean= assignboolean SEMICOLON | ARRAY data_type= tipo ID COLON exp SEMICOLON )
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


          # at line 167:5: INT ID as_int= assignint SEMICOLON
          __INT3__ = match( INT, TOKENS_FOLLOWING_INT_IN_variables_666 )
          if @state.backtracking == 0

            tree_for_INT3 = @adaptor.create_with_payload( __INT3__ )
            @adaptor.add_child( root_0, tree_for_INT3 )

          end
          __ID4__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_668 )
          if @state.backtracking == 0

            tree_for_ID4 = @adaptor.create_with_payload( __ID4__ )
            @adaptor.add_child( root_0, tree_for_ID4 )

          end
          @state.following.push( TOKENS_FOLLOWING_assignint_IN_variables_672 )
          as_int = assignint
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, as_int.tree )
          end
          __SEMICOLON5__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_674 )
          if @state.backtracking == 0

            tree_for_SEMICOLON5 = @adaptor.create_with_payload( __SEMICOLON5__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON5 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.var_info = { id: __ID4__.text, type: __INT3__.text, value: ( as_int.nil? ? nil : as_int.value ) } 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 168:7: FLOAT ID as_float= assignfloat SEMICOLON
          __FLOAT6__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_variables_684 )
          if @state.backtracking == 0

            tree_for_FLOAT6 = @adaptor.create_with_payload( __FLOAT6__ )
            @adaptor.add_child( root_0, tree_for_FLOAT6 )

          end
          __ID7__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_686 )
          if @state.backtracking == 0

            tree_for_ID7 = @adaptor.create_with_payload( __ID7__ )
            @adaptor.add_child( root_0, tree_for_ID7 )

          end
          @state.following.push( TOKENS_FOLLOWING_assignfloat_IN_variables_690 )
          as_float = assignfloat
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, as_float.tree )
          end
          __SEMICOLON8__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_692 )
          if @state.backtracking == 0

            tree_for_SEMICOLON8 = @adaptor.create_with_payload( __SEMICOLON8__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON8 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.var_info = { id: __ID7__.text, type: __FLOAT6__.text, value: ( as_float.nil? ? nil : as_float.value ) } 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 169:7: STRING ID as_string= assignstring SEMICOLON
          __STRING9__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_variables_702 )
          if @state.backtracking == 0

            tree_for_STRING9 = @adaptor.create_with_payload( __STRING9__ )
            @adaptor.add_child( root_0, tree_for_STRING9 )

          end
          __ID10__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_704 )
          if @state.backtracking == 0

            tree_for_ID10 = @adaptor.create_with_payload( __ID10__ )
            @adaptor.add_child( root_0, tree_for_ID10 )

          end
          @state.following.push( TOKENS_FOLLOWING_assignstring_IN_variables_708 )
          as_string = assignstring
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, as_string.tree )
          end
          __SEMICOLON11__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_710 )
          if @state.backtracking == 0

            tree_for_SEMICOLON11 = @adaptor.create_with_payload( __SEMICOLON11__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON11 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.var_info = { id: __ID10__.text, type: __STRING9__.text, value: ( as_string.nil? ? nil : as_string.value ) }
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 170:7: BOOLEAN ID as_boolean= assignboolean SEMICOLON
          __BOOLEAN12__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_variables_720 )
          if @state.backtracking == 0

            tree_for_BOOLEAN12 = @adaptor.create_with_payload( __BOOLEAN12__ )
            @adaptor.add_child( root_0, tree_for_BOOLEAN12 )

          end
          __ID13__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_722 )
          if @state.backtracking == 0

            tree_for_ID13 = @adaptor.create_with_payload( __ID13__ )
            @adaptor.add_child( root_0, tree_for_ID13 )

          end
          @state.following.push( TOKENS_FOLLOWING_assignboolean_IN_variables_726 )
          as_boolean = assignboolean
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, as_boolean.tree )
          end
          __SEMICOLON14__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_728 )
          if @state.backtracking == 0

            tree_for_SEMICOLON14 = @adaptor.create_with_payload( __SEMICOLON14__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON14 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.var_info = { id: __ID13__.text, type: __BOOLEAN12__.text, value: ( as_boolean.nil? ? nil : as_boolean.value ) }
            # <-- action
          end

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 171:7: ARRAY data_type= tipo ID COLON exp SEMICOLON
          __ARRAY15__ = match( ARRAY, TOKENS_FOLLOWING_ARRAY_IN_variables_738 )
          if @state.backtracking == 0

            tree_for_ARRAY15 = @adaptor.create_with_payload( __ARRAY15__ )
            @adaptor.add_child( root_0, tree_for_ARRAY15 )

          end
          @state.following.push( TOKENS_FOLLOWING_tipo_IN_variables_742 )
          data_type = tipo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, data_type.tree )
          end
          __ID16__ = match( ID, TOKENS_FOLLOWING_ID_IN_variables_744 )
          if @state.backtracking == 0

            tree_for_ID16 = @adaptor.create_with_payload( __ID16__ )
            @adaptor.add_child( root_0, tree_for_ID16 )

          end
          __COLON17__ = match( COLON, TOKENS_FOLLOWING_COLON_IN_variables_746 )
          if @state.backtracking == 0

            tree_for_COLON17 = @adaptor.create_with_payload( __COLON17__ )
            @adaptor.add_child( root_0, tree_for_COLON17 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_variables_748 )
          exp18 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp18.tree )
          end
          __SEMICOLON19__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_variables_750 )
          if @state.backtracking == 0

            tree_for_SEMICOLON19 = @adaptor.create_with_payload( __SEMICOLON19__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON19 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.var_info = { id: __ID16__.text, type: "[#{( data_type.nil? ? nil : data_type.type )}]" }  
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
    # 174:1: assignint returns [value] : ( | | ASSIGN CTEI );
    # 
    def assignint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = AssignintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN20__ = nil
      __CTEI21__ = nil

      tree_for_ASSIGN20 = nil
      tree_for_CTEI21 = nil

      begin
        # at line 174:25: ( | | ASSIGN CTEI )
        alt_3 = 3
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == SEMICOLON )
          look_3_1 = @input.peek( 2 )

          if ( syntactic_predicate?( :synpred7_Simple ) )
            alt_3 = 1
          elsif ( syntactic_predicate?( :synpred8_Simple ) )
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


          # at line 175:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 176:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 176:7: ASSIGN CTEI
          __ASSIGN20__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignint_782 )
          if @state.backtracking == 0

            tree_for_ASSIGN20 = @adaptor.create_with_payload( __ASSIGN20__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN20 )

          end
          __CTEI21__ = match( CTEI, TOKENS_FOLLOWING_CTEI_IN_assignint_784 )
          if @state.backtracking == 0

            tree_for_CTEI21 = @adaptor.create_with_payload( __CTEI21__ )
            @adaptor.add_child( root_0, tree_for_CTEI21 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.value = __CTEI21__.text.to_i 
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
    # 179:1: assignfloat returns [value] : ( | | ASSIGN CTEF );
    # 
    def assignfloat
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = AssignfloatReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN22__ = nil
      __CTEF23__ = nil

      tree_for_ASSIGN22 = nil
      tree_for_CTEF23 = nil

      begin
        # at line 179:27: ( | | ASSIGN CTEF )
        alt_4 = 3
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == SEMICOLON )
          look_4_1 = @input.peek( 2 )

          if ( syntactic_predicate?( :synpred9_Simple ) )
            alt_4 = 1
          elsif ( syntactic_predicate?( :synpred10_Simple ) )
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


          # at line 180:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 181:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 181:7: ASSIGN CTEF
          __ASSIGN22__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignfloat_815 )
          if @state.backtracking == 0

            tree_for_ASSIGN22 = @adaptor.create_with_payload( __ASSIGN22__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN22 )

          end
          __CTEF23__ = match( CTEF, TOKENS_FOLLOWING_CTEF_IN_assignfloat_817 )
          if @state.backtracking == 0

            tree_for_CTEF23 = @adaptor.create_with_payload( __CTEF23__ )
            @adaptor.add_child( root_0, tree_for_CTEF23 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.value = __CTEF23__.text.to_f
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
    # 184:1: assignstring returns [value] : ( | | ASSIGN CTES );
    # 
    def assignstring
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = AssignstringReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN24__ = nil
      __CTES25__ = nil

      tree_for_ASSIGN24 = nil
      tree_for_CTES25 = nil

      begin
        # at line 184:28: ( | | ASSIGN CTES )
        alt_5 = 3
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == SEMICOLON )
          look_5_1 = @input.peek( 2 )

          if ( syntactic_predicate?( :synpred11_Simple ) )
            alt_5 = 1
          elsif ( syntactic_predicate?( :synpred12_Simple ) )
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


          # at line 185:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 186:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 186:7: ASSIGN CTES
          __ASSIGN24__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignstring_849 )
          if @state.backtracking == 0

            tree_for_ASSIGN24 = @adaptor.create_with_payload( __ASSIGN24__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN24 )

          end
          __CTES25__ = match( CTES, TOKENS_FOLLOWING_CTES_IN_assignstring_851 )
          if @state.backtracking == 0

            tree_for_CTES25 = @adaptor.create_with_payload( __CTES25__ )
            @adaptor.add_child( root_0, tree_for_CTES25 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.value = __CTES25__.text 
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
    # 189:1: assignboolean returns [value] : ( | | ASSIGN CTEB );
    # 
    def assignboolean
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = AssignbooleanReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN26__ = nil
      __CTEB27__ = nil

      tree_for_ASSIGN26 = nil
      tree_for_CTEB27 = nil

      begin
        # at line 189:29: ( | | ASSIGN CTEB )
        alt_6 = 3
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == SEMICOLON )
          look_6_1 = @input.peek( 2 )

          if ( syntactic_predicate?( :synpred13_Simple ) )
            alt_6 = 1
          elsif ( syntactic_predicate?( :synpred14_Simple ) )
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


          # at line 190:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 191:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 191:7: ASSIGN CTEB
          __ASSIGN26__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignboolean_882 )
          if @state.backtracking == 0

            tree_for_ASSIGN26 = @adaptor.create_with_payload( __ASSIGN26__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN26 )

          end
          __CTEB27__ = match( CTEB, TOKENS_FOLLOWING_CTEB_IN_assignboolean_884 )
          if @state.backtracking == 0

            tree_for_CTEB27 = @adaptor.create_with_payload( __CTEB27__ )
            @adaptor.add_child( root_0, tree_for_CTEB27 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.value = __CTEB27__.text == 'true' 
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
    # 194:1: tipo returns [type] : ( INT | FLOAT | STRING | BOOLEAN );
    # 
    def tipo
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = TipoReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __INT28__ = nil
      __FLOAT29__ = nil
      __STRING30__ = nil
      __BOOLEAN31__ = nil

      tree_for_INT28 = nil
      tree_for_FLOAT29 = nil
      tree_for_STRING30 = nil
      tree_for_BOOLEAN31 = nil

      begin
        # at line 194:19: ( INT | FLOAT | STRING | BOOLEAN )
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


          # at line 195:5: INT
          __INT28__ = match( INT, TOKENS_FOLLOWING_INT_IN_tipo_906 )
          if @state.backtracking == 0

            tree_for_INT28 = @adaptor.create_with_payload( __INT28__ )
            @adaptor.add_child( root_0, tree_for_INT28 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = __INT28__.text 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 196:7: FLOAT
          __FLOAT29__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_tipo_916 )
          if @state.backtracking == 0

            tree_for_FLOAT29 = @adaptor.create_with_payload( __FLOAT29__ )
            @adaptor.add_child( root_0, tree_for_FLOAT29 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = __FLOAT29__.text 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 197:7: STRING
          __STRING30__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_tipo_926 )
          if @state.backtracking == 0

            tree_for_STRING30 = @adaptor.create_with_payload( __STRING30__ )
            @adaptor.add_child( root_0, tree_for_STRING30 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = __STRING30__.text 
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 198:7: BOOLEAN
          __BOOLEAN31__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_tipo_936 )
          if @state.backtracking == 0

            tree_for_BOOLEAN31 = @adaptor.create_with_payload( __BOOLEAN31__ )
            @adaptor.add_child( root_0, tree_for_BOOLEAN31 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type = __BOOLEAN31__.text 
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

    FuncReturnValue = define_return_scope :list

    # 
    # parser rule func
    # 
    # (in Simple.g)
    # 201:1: func returns [list] : ( | | proc= funcion procs= func );
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      proc = nil
      procs = nil


      begin
        # at line 201:19: ( | | proc= funcion procs= func )
        alt_8 = 3
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == MAIN )
          look_8_1 = @input.peek( 2 )

          if ( syntactic_predicate?( :synpred18_Simple ) )
            alt_8 = 1
          elsif ( syntactic_predicate?( :synpred19_Simple ) )
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


          # at line 202:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 203:5: 

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 203:7: proc= funcion procs= func
          @state.following.push( TOKENS_FOLLOWING_funcion_IN_func_969 )
          proc = funcion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, proc.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_func_IN_func_973 )
          procs = func
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, procs.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
                    return_value.list = [( proc.nil? ? nil : proc.func_info )]
                    return_value.list.concat(( procs.nil? ? nil : procs.list )) unless ( procs.nil? ? nil : procs.list ).nil?
                  
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
        # trace_out( __method__, 10 )

      end
      
      return return_value
    end

    FuncionReturnValue = define_return_scope :func_info

    # 
    # parser rule funcion
    # 
    # (in Simple.g)
    # 209:1: funcion returns [func_info] : FUNCTION ID LPARENT arguments= argumentos RPARENT COLON return_type= retornofunc LBRACK local= var est RETURN retorno SEMICOLON RBRACK ;
    # 
    def funcion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = FuncionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FUNCTION32__ = nil
      __ID33__ = nil
      __LPARENT34__ = nil
      __RPARENT35__ = nil
      __COLON36__ = nil
      __LBRACK37__ = nil
      __RETURN39__ = nil
      __SEMICOLON41__ = nil
      __RBRACK42__ = nil
      arguments = nil
      return_type = nil
      local = nil
      est38 = nil
      retorno40 = nil

      tree_for_FUNCTION32 = nil
      tree_for_ID33 = nil
      tree_for_LPARENT34 = nil
      tree_for_RPARENT35 = nil
      tree_for_COLON36 = nil
      tree_for_LBRACK37 = nil
      tree_for_RETURN39 = nil
      tree_for_SEMICOLON41 = nil
      tree_for_RBRACK42 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 210:5: FUNCTION ID LPARENT arguments= argumentos RPARENT COLON return_type= retornofunc LBRACK local= var est RETURN retorno SEMICOLON RBRACK
        __FUNCTION32__ = match( FUNCTION, TOKENS_FOLLOWING_FUNCTION_IN_funcion_994 )
        if @state.backtracking == 0

          tree_for_FUNCTION32 = @adaptor.create_with_payload( __FUNCTION32__ )
          @adaptor.add_child( root_0, tree_for_FUNCTION32 )

        end
        __ID33__ = match( ID, TOKENS_FOLLOWING_ID_IN_funcion_996 )
        if @state.backtracking == 0

          tree_for_ID33 = @adaptor.create_with_payload( __ID33__ )
          @adaptor.add_child( root_0, tree_for_ID33 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
          @vars_block_stack.last.scope_location = __ID33__.text
          # <-- action
        end
        __LPARENT34__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_funcion_1000 )
        if @state.backtracking == 0

          tree_for_LPARENT34 = @adaptor.create_with_payload( __LPARENT34__ )
          @adaptor.add_child( root_0, tree_for_LPARENT34 )

        end
        @state.following.push( TOKENS_FOLLOWING_argumentos_IN_funcion_1004 )
        arguments = argumentos
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, arguments.tree )
        end
        __RPARENT35__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_funcion_1006 )
        if @state.backtracking == 0

          tree_for_RPARENT35 = @adaptor.create_with_payload( __RPARENT35__ )
          @adaptor.add_child( root_0, tree_for_RPARENT35 )

        end
        __COLON36__ = match( COLON, TOKENS_FOLLOWING_COLON_IN_funcion_1008 )
        if @state.backtracking == 0

          tree_for_COLON36 = @adaptor.create_with_payload( __COLON36__ )
          @adaptor.add_child( root_0, tree_for_COLON36 )

        end
        @state.following.push( TOKENS_FOLLOWING_retornofunc_IN_funcion_1012 )
        return_type = retornofunc
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, return_type.tree )
        end
        __LBRACK37__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_funcion_1014 )
        if @state.backtracking == 0

          tree_for_LBRACK37 = @adaptor.create_with_payload( __LBRACK37__ )
          @adaptor.add_child( root_0, tree_for_LBRACK37 )

        end
        @state.following.push( TOKENS_FOLLOWING_var_IN_funcion_1018 )
        local = var
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, local.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_est_IN_funcion_1020 )
        est38 = est
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, est38.tree )
        end
        __RETURN39__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_funcion_1022 )
        if @state.backtracking == 0

          tree_for_RETURN39 = @adaptor.create_with_payload( __RETURN39__ )
          @adaptor.add_child( root_0, tree_for_RETURN39 )

        end
        @state.following.push( TOKENS_FOLLOWING_retorno_IN_funcion_1024 )
        retorno40 = retorno
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, retorno40.tree )
        end
        __SEMICOLON41__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_funcion_1026 )
        if @state.backtracking == 0

          tree_for_SEMICOLON41 = @adaptor.create_with_payload( __SEMICOLON41__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON41 )

        end
        __RBRACK42__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_funcion_1028 )
        if @state.backtracking == 0

          tree_for_RBRACK42 = @adaptor.create_with_payload( __RBRACK42__ )
          @adaptor.add_child( root_0, tree_for_RBRACK42 )

        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action

                  $local_vars = {}
                  unless ( local.nil? ? nil : local.vars_array ).nil?
                    ( local.nil? ? nil : local.vars_array ).each do | var_info |
                      unless var_info.nil?
                        if $local_vars.has_key?(var_info[:id])
                          print("\nERROR: Variable already defined in procedure\n")
                        else
                          $local_vars[var_info[:id]] = var_info
                        end
                      end
                    end
                  end
                  return_value.func_info = { id: __ID33__.text, args: ( arguments.nil? ? nil : arguments.list ), local_vars: $local_vars, return_type: ( return_type.nil? ? nil : return_type.type ) }
                
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
    # 227:1: argumentos returns [list] : ( | data_type= tipo ref ID more_args= argumentoaux );
    # 
    def argumentos
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ArgumentosReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID44__ = nil
      data_type = nil
      more_args = nil
      ref43 = nil

      tree_for_ID44 = nil

      begin
        # at line 227:25: ( | data_type= tipo ref ID more_args= argumentoaux )
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


          # at line 228:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 228:7: data_type= tipo ref ID more_args= argumentoaux
          @state.following.push( TOKENS_FOLLOWING_tipo_IN_argumentos_1055 )
          data_type = tipo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, data_type.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_ref_IN_argumentos_1057 )
          ref43 = ref
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, ref43.tree )
          end
          __ID44__ = match( ID, TOKENS_FOLLOWING_ID_IN_argumentos_1059 )
          if @state.backtracking == 0

            tree_for_ID44 = @adaptor.create_with_payload( __ID44__ )
            @adaptor.add_child( root_0, tree_for_ID44 )

          end
          @state.following.push( TOKENS_FOLLOWING_argumentoaux_IN_argumentos_1063 )
          more_args = argumentoaux
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, more_args.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action

                    return_value.list = [ {type: ( data_type.nil? ? nil : data_type.type ), id: __ID44__.text } ]
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
    # 234:1: argumentoaux returns [list] : ( | COMMA data_type= tipo ref ID more_args= argumentoaux );
    # 
    def argumentoaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = ArgumentoauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA45__ = nil
      __ID47__ = nil
      data_type = nil
      more_args = nil
      ref46 = nil

      tree_for_COMMA45 = nil
      tree_for_ID47 = nil

      begin
        # at line 234:27: ( | COMMA data_type= tipo ref ID more_args= argumentoaux )
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


          # at line 235:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 235:7: COMMA data_type= tipo ref ID more_args= argumentoaux
          __COMMA45__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argumentoaux_1088 )
          if @state.backtracking == 0

            tree_for_COMMA45 = @adaptor.create_with_payload( __COMMA45__ )
            @adaptor.add_child( root_0, tree_for_COMMA45 )

          end
          @state.following.push( TOKENS_FOLLOWING_tipo_IN_argumentoaux_1092 )
          data_type = tipo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, data_type.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_ref_IN_argumentoaux_1094 )
          ref46 = ref
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, ref46.tree )
          end
          __ID47__ = match( ID, TOKENS_FOLLOWING_ID_IN_argumentoaux_1096 )
          if @state.backtracking == 0

            tree_for_ID47 = @adaptor.create_with_payload( __ID47__ )
            @adaptor.add_child( root_0, tree_for_ID47 )

          end
          @state.following.push( TOKENS_FOLLOWING_argumentoaux_IN_argumentoaux_1100 )
          more_args = argumentoaux
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, more_args.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
                    return_value.list = [ {type: ( data_type.nil? ? nil : data_type.type ), id: __ID47__.text } ]
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
    # 241:1: ref : ( | REF );
    # 
    def ref
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = RefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __REF48__ = nil

      tree_for_REF48 = nil

      begin
        # at line 241:4: ( | REF )
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


          # at line 242:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 242:7: REF
          __REF48__ = match( REF, TOKENS_FOLLOWING_REF_IN_ref_1122 )
          if @state.backtracking == 0

            tree_for_REF48 = @adaptor.create_with_payload( __REF48__ )
            @adaptor.add_child( root_0, tree_for_REF48 )

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
    # 245:1: retornofunc returns [type] : ( VOID | data_type= tipo );
    # 
    def retornofunc
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = RetornofuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __VOID49__ = nil
      data_type = nil

      tree_for_VOID49 = nil

      begin
        # at line 245:26: ( VOID | data_type= tipo )
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


          # at line 246:5: VOID
          __VOID49__ = match( VOID, TOKENS_FOLLOWING_VOID_IN_retornofunc_1143 )
          if @state.backtracking == 0

            tree_for_VOID49 = @adaptor.create_with_payload( __VOID49__ )
            @adaptor.add_child( root_0, tree_for_VOID49 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             return_value.type=__VOID49__.text 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 247:7: data_type= tipo
          @state.following.push( TOKENS_FOLLOWING_tipo_IN_retornofunc_1155 )
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
    # (in Simple.g)
    # 250:1: est : estatutos estaux ;
    # 
    def est
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = EstReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      estatutos50 = nil
      estaux51 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 251:5: estatutos estaux
        @state.following.push( TOKENS_FOLLOWING_estatutos_IN_est_1173 )
        estatutos50 = estatutos
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, estatutos50.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_estaux_IN_est_1175 )
        estaux51 = estaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, estaux51.tree )
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
    # 254:1: estaux : ( | estatutos estaux );
    # 
    def estaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = EstauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      estatutos52 = nil
      estaux53 = nil


      begin
        # at line 254:7: ( | estatutos estaux )
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


          # at line 255:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 255:7: estatutos estaux
          @state.following.push( TOKENS_FOLLOWING_estatutos_IN_estaux_1197 )
          estatutos52 = estatutos
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, estatutos52.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_estaux_IN_estaux_1199 )
          estaux53 = estaux
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, estaux53.tree )
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
    # 258:1: estatutos : ( ID idestatutos SEMICOLON | condicion | escritura | ciclo | lectura );
    # 
    def estatutos
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = EstatutosReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID54__ = nil
      __SEMICOLON56__ = nil
      idestatutos55 = nil
      condicion57 = nil
      escritura58 = nil
      ciclo59 = nil
      lectura60 = nil

      tree_for_ID54 = nil
      tree_for_SEMICOLON56 = nil

      begin
        # at line 258:10: ( ID idestatutos SEMICOLON | condicion | escritura | ciclo | lectura )
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


          # at line 259:5: ID idestatutos SEMICOLON
          __ID54__ = match( ID, TOKENS_FOLLOWING_ID_IN_estatutos_1217 )
          if @state.backtracking == 0

            tree_for_ID54 = @adaptor.create_with_payload( __ID54__ )
            @adaptor.add_child( root_0, tree_for_ID54 )

          end
          @state.following.push( TOKENS_FOLLOWING_idestatutos_IN_estatutos_1219 )
          idestatutos55 = idestatutos
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, idestatutos55.tree )
          end
          __SEMICOLON56__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_estatutos_1221 )
          if @state.backtracking == 0

            tree_for_SEMICOLON56 = @adaptor.create_with_payload( __SEMICOLON56__ )
            @adaptor.add_child( root_0, tree_for_SEMICOLON56 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[ESTATUTOS] ") 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 260:7: condicion
          @state.following.push( TOKENS_FOLLOWING_condicion_IN_estatutos_1231 )
          condicion57 = condicion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, condicion57.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[ESTATUTOS] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 261:7: escritura
          @state.following.push( TOKENS_FOLLOWING_escritura_IN_estatutos_1241 )
          escritura58 = escritura
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, escritura58.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[ESTATUTOS] ") 
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 262:7: ciclo
          @state.following.push( TOKENS_FOLLOWING_ciclo_IN_estatutos_1251 )
          ciclo59 = ciclo
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, ciclo59.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[ESTATUTOS] ") 
            # <-- action
          end

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 263:7: lectura
          @state.following.push( TOKENS_FOLLOWING_lectura_IN_estatutos_1261 )
          lectura60 = lectura
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, lectura60.tree )
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
    # 266:1: idestatutos : ( llamada | array ASSIGN expresion | ASSIGN expresion );
    # 
    def idestatutos
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = IdestatutosReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN63__ = nil
      __ASSIGN65__ = nil
      llamada61 = nil
      array62 = nil
      expresion64 = nil
      expresion66 = nil

      tree_for_ASSIGN63 = nil
      tree_for_ASSIGN65 = nil

      begin
        # at line 266:12: ( llamada | array ASSIGN expresion | ASSIGN expresion )
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


          # at line 267:5: llamada
          @state.following.push( TOKENS_FOLLOWING_llamada_IN_idestatutos_1279 )
          llamada61 = llamada
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, llamada61.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[IDESTATUTOS] ") 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 268:7: array ASSIGN expresion
          @state.following.push( TOKENS_FOLLOWING_array_IN_idestatutos_1289 )
          array62 = array
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, array62.tree )
          end
          __ASSIGN63__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_idestatutos_1291 )
          if @state.backtracking == 0

            tree_for_ASSIGN63 = @adaptor.create_with_payload( __ASSIGN63__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN63 )

          end
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_idestatutos_1293 )
          expresion64 = expresion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expresion64.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[IDESTATUTOS] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 269:7: ASSIGN expresion
          __ASSIGN65__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_idestatutos_1303 )
          if @state.backtracking == 0

            tree_for_ASSIGN65 = @adaptor.create_with_payload( __ASSIGN65__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN65 )

          end
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_idestatutos_1305 )
          expresion66 = expresion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expresion66.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[IDESTATUTOS] ") 
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
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    LlamadaReturnValue = define_return_scope 

    # 
    # parser rule llamada
    # 
    # (in Simple.g)
    # 272:1: llamada : LPARENT llamadaargs RPARENT ;
    # 
    def llamada
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = LlamadaReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __LPARENT67__ = nil
      __RPARENT69__ = nil
      llamadaargs68 = nil

      tree_for_LPARENT67 = nil
      tree_for_RPARENT69 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 273:5: LPARENT llamadaargs RPARENT
        __LPARENT67__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_llamada_1323 )
        if @state.backtracking == 0

          tree_for_LPARENT67 = @adaptor.create_with_payload( __LPARENT67__ )
          @adaptor.add_child( root_0, tree_for_LPARENT67 )

        end
        @state.following.push( TOKENS_FOLLOWING_llamadaargs_IN_llamada_1325 )
        llamadaargs68 = llamadaargs
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, llamadaargs68.tree )
        end
        __RPARENT69__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_llamada_1327 )
        if @state.backtracking == 0

          tree_for_RPARENT69 = @adaptor.create_with_payload( __RPARENT69__ )
          @adaptor.add_child( root_0, tree_for_RPARENT69 )

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
    # 276:1: llamadaargs : ( | exp llamadaargsaux );
    # 
    def llamadaargs
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = LlamadaargsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      exp70 = nil
      llamadaargsaux71 = nil


      begin
        # at line 276:12: ( | exp llamadaargsaux )
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == RPARENT )
          alt_16 = 1
        elsif ( look_16_0 == NOT || look_16_0.between?( PLUS, MINUS ) || look_16_0.between?( CTEI, CTEF ) || look_16_0.between?( CTES, CTEB ) || look_16_0 == ID )
          alt_16 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 16, 0 )
        end
        case alt_16
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 277:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 277:7: exp llamadaargsaux
          @state.following.push( TOKENS_FOLLOWING_exp_IN_llamadaargs_1349 )
          exp70 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp70.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_llamadaargsaux_IN_llamadaargs_1351 )
          llamadaargsaux71 = llamadaargsaux
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, llamadaargsaux71.tree )
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
    # 280:1: llamadaargsaux : ( | COMMA exp llamadaargsaux );
    # 
    def llamadaargsaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = LlamadaargsauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA72__ = nil
      exp73 = nil
      llamadaargsaux74 = nil

      tree_for_COMMA72 = nil

      begin
        # at line 280:15: ( | COMMA exp llamadaargsaux )
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


          # at line 281:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 281:7: COMMA exp llamadaargsaux
          __COMMA72__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_llamadaargsaux_1373 )
          if @state.backtracking == 0

            tree_for_COMMA72 = @adaptor.create_with_payload( __COMMA72__ )
            @adaptor.add_child( root_0, tree_for_COMMA72 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_llamadaargsaux_1375 )
          exp73 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp73.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_llamadaargsaux_IN_llamadaargsaux_1377 )
          llamadaargsaux74 = llamadaargsaux
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, llamadaargsaux74.tree )
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
    # 284:1: array : LSBRACK exp RSBRACK ;
    # 
    def array
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ArrayReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __LSBRACK75__ = nil
      __RSBRACK77__ = nil
      exp76 = nil

      tree_for_LSBRACK75 = nil
      tree_for_RSBRACK77 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 285:5: LSBRACK exp RSBRACK
        __LSBRACK75__ = match( LSBRACK, TOKENS_FOLLOWING_LSBRACK_IN_array_1395 )
        if @state.backtracking == 0

          tree_for_LSBRACK75 = @adaptor.create_with_payload( __LSBRACK75__ )
          @adaptor.add_child( root_0, tree_for_LSBRACK75 )

        end
        @state.following.push( TOKENS_FOLLOWING_exp_IN_array_1397 )
        exp76 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp76.tree )
        end
        __RSBRACK77__ = match( RSBRACK, TOKENS_FOLLOWING_RSBRACK_IN_array_1399 )
        if @state.backtracking == 0

          tree_for_RSBRACK77 = @adaptor.create_with_payload( __RSBRACK77__ )
          @adaptor.add_child( root_0, tree_for_RSBRACK77 )

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
    # 288:1: expresion : exp expresionaux ;
    # 
    def expresion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = ExpresionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      exp78 = nil
      expresionaux79 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 289:5: exp expresionaux
        @state.following.push( TOKENS_FOLLOWING_exp_IN_expresion_1417 )
        exp78 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp78.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_expresionaux_IN_expresion_1419 )
        expresionaux79 = expresionaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expresionaux79.tree )
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
    # 292:1: expresionaux : ( | comparacion expresion | logico expresion );
    # 
    def expresionaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ExpresionauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      comparacion80 = nil
      expresion81 = nil
      logico82 = nil
      expresion83 = nil


      begin
        # at line 292:13: ( | comparacion expresion | logico expresion )
        alt_18 = 3
        case look_18 = @input.peek( 1 )
        when EOF, RPARENT, SEMICOLON then alt_18 = 1
        when LT, LE, GT, GE, EQ, NE then alt_18 = 2
        when AND, OR then alt_18 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 18, 0 )
        end
        case alt_18
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 293:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 293:7: comparacion expresion
          @state.following.push( TOKENS_FOLLOWING_comparacion_IN_expresionaux_1441 )
          comparacion80 = comparacion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, comparacion80.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_expresionaux_1443 )
          expresion81 = expresion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expresion81.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[EXPRESIONAX] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 294:7: logico expresion
          @state.following.push( TOKENS_FOLLOWING_logico_IN_expresionaux_1453 )
          logico82 = logico
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, logico82.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_expresionaux_1455 )
          expresion83 = expresion
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expresion83.tree )
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
    # 297:1: exp : termino expaux ;
    # 
    def exp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ExpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      termino84 = nil
      expaux85 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 298:5: termino expaux
        @state.following.push( TOKENS_FOLLOWING_termino_IN_exp_1473 )
        termino84 = termino
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, termino84.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_expaux_IN_exp_1475 )
        expaux85 = expaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expaux85.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           print("[EXP] ") 
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
        # trace_out( __method__, 26 )

      end
      
      return return_value
    end

    ExpauxReturnValue = define_return_scope 

    # 
    # parser rule expaux
    # 
    # (in Simple.g)
    # 301:1: expaux : ( | PLUS exp | MINUS exp );
    # 
    def expaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ExpauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS86__ = nil
      __MINUS88__ = nil
      exp87 = nil
      exp89 = nil

      tree_for_PLUS86 = nil
      tree_for_MINUS88 = nil

      begin
        # at line 301:7: ( | PLUS exp | MINUS exp )
        alt_19 = 3
        case look_19 = @input.peek( 1 )
        when EOF, LT, LE, GT, GE, EQ, NE, AND, OR, RPARENT, RSBRACK, COMMA, SEMICOLON then alt_19 = 1
        when PLUS then alt_19 = 2
        when MINUS then alt_19 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 19, 0 )
        end
        case alt_19
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 302:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 302:7: PLUS exp
          __PLUS86__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expaux_1497 )
          if @state.backtracking == 0

            tree_for_PLUS86 = @adaptor.create_with_payload( __PLUS86__ )
            @adaptor.add_child( root_0, tree_for_PLUS86 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_expaux_1499 )
          exp87 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp87.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[EXPAUX] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 303:7: MINUS exp
          __MINUS88__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expaux_1509 )
          if @state.backtracking == 0

            tree_for_MINUS88 = @adaptor.create_with_payload( __MINUS88__ )
            @adaptor.add_child( root_0, tree_for_MINUS88 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_expaux_1511 )
          exp89 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp89.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[EXPAUX] ") 
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
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    TerminoReturnValue = define_return_scope 

    # 
    # parser rule termino
    # 
    # (in Simple.g)
    # 306:1: termino : factor terminoaux ;
    # 
    def termino
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = TerminoReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      factor90 = nil
      terminoaux91 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 307:5: factor terminoaux
        @state.following.push( TOKENS_FOLLOWING_factor_IN_termino_1529 )
        factor90 = factor
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, factor90.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_terminoaux_IN_termino_1531 )
        terminoaux91 = terminoaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, terminoaux91.tree )
        end
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           print("[TERMINO] ") 
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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    TerminoauxReturnValue = define_return_scope 

    # 
    # parser rule terminoaux
    # 
    # (in Simple.g)
    # 310:1: terminoaux : ( | TIMES termino | DIVIDE termino );
    # 
    def terminoaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = TerminoauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TIMES92__ = nil
      __DIVIDE94__ = nil
      termino93 = nil
      termino95 = nil

      tree_for_TIMES92 = nil
      tree_for_DIVIDE94 = nil

      begin
        # at line 310:11: ( | TIMES termino | DIVIDE termino )
        alt_20 = 3
        case look_20 = @input.peek( 1 )
        when EOF, LT, LE, GT, GE, EQ, NE, AND, OR, RPARENT, RSBRACK, COMMA, SEMICOLON, PLUS, MINUS then alt_20 = 1
        when TIMES then alt_20 = 2
        when DIVIDE then alt_20 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 20, 0 )
        end
        case alt_20
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 311:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 311:7: TIMES termino
          __TIMES92__ = match( TIMES, TOKENS_FOLLOWING_TIMES_IN_terminoaux_1553 )
          if @state.backtracking == 0

            tree_for_TIMES92 = @adaptor.create_with_payload( __TIMES92__ )
            @adaptor.add_child( root_0, tree_for_TIMES92 )

          end
          @state.following.push( TOKENS_FOLLOWING_termino_IN_terminoaux_1555 )
          termino93 = termino
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, termino93.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[TERMINOAUX] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 312:7: DIVIDE termino
          __DIVIDE94__ = match( DIVIDE, TOKENS_FOLLOWING_DIVIDE_IN_terminoaux_1565 )
          if @state.backtracking == 0

            tree_for_DIVIDE94 = @adaptor.create_with_payload( __DIVIDE94__ )
            @adaptor.add_child( root_0, tree_for_DIVIDE94 )

          end
          @state.following.push( TOKENS_FOLLOWING_termino_IN_terminoaux_1567 )
          termino95 = termino
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, termino95.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[TERMINOAUX] ") 
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
        # trace_out( __method__, 29 )

      end
      
      return return_value
    end

    FactorReturnValue = define_return_scope 

    # 
    # parser rule factor
    # 
    # (in Simple.g)
    # 315:1: factor : ( NOT notfactor | sign varcte | varcte );
    # 
    def factor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = FactorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT96__ = nil
      notfactor97 = nil
      sign98 = nil
      varcte99 = nil
      varcte100 = nil

      tree_for_NOT96 = nil

      begin
        # at line 315:7: ( NOT notfactor | sign varcte | varcte )
        alt_21 = 3
        case look_21 = @input.peek( 1 )
        when NOT then alt_21 = 1
        when PLUS, MINUS then alt_21 = 2
        when CTEI, CTEF, CTES, CTEB, ID then alt_21 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 21, 0 )
        end
        case alt_21
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 316:5: NOT notfactor
          __NOT96__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_factor_1585 )
          if @state.backtracking == 0

            tree_for_NOT96 = @adaptor.create_with_payload( __NOT96__ )
            @adaptor.add_child( root_0, tree_for_NOT96 )

          end
          @state.following.push( TOKENS_FOLLOWING_notfactor_IN_factor_1587 )
          notfactor97 = notfactor
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, notfactor97.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[FACTOR] ") 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 317:7: sign varcte
          @state.following.push( TOKENS_FOLLOWING_sign_IN_factor_1597 )
          sign98 = sign
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, sign98.tree )
          end
          @state.following.push( TOKENS_FOLLOWING_varcte_IN_factor_1599 )
          varcte99 = varcte
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, varcte99.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[FACTOR] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 318:7: varcte
          @state.following.push( TOKENS_FOLLOWING_varcte_IN_factor_1609 )
          varcte100 = varcte
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, varcte100.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[FACTOR] ") 
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
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    NotfactorReturnValue = define_return_scope 

    # 
    # parser rule notfactor
    # 
    # (in Simple.g)
    # 321:1: notfactor : ( LPARENT exp RPARENT | varcte );
    # 
    def notfactor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = NotfactorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __LPARENT101__ = nil
      __RPARENT103__ = nil
      exp102 = nil
      varcte104 = nil

      tree_for_LPARENT101 = nil
      tree_for_RPARENT103 = nil

      begin
        # at line 321:10: ( LPARENT exp RPARENT | varcte )
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


          # at line 322:5: LPARENT exp RPARENT
          __LPARENT101__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_notfactor_1627 )
          if @state.backtracking == 0

            tree_for_LPARENT101 = @adaptor.create_with_payload( __LPARENT101__ )
            @adaptor.add_child( root_0, tree_for_LPARENT101 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_notfactor_1629 )
          exp102 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp102.tree )
          end
          __RPARENT103__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_notfactor_1631 )
          if @state.backtracking == 0

            tree_for_RPARENT103 = @adaptor.create_with_payload( __RPARENT103__ )
            @adaptor.add_child( root_0, tree_for_RPARENT103 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[NOTFACTOR] ") 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 323:7: varcte
          @state.following.push( TOKENS_FOLLOWING_varcte_IN_notfactor_1641 )
          varcte104 = varcte
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, varcte104.tree )
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
    # 326:1: sign : ( PLUS | MINUS );
    # 
    def sign
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = SignReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS105__ = nil
      __MINUS106__ = nil

      tree_for_PLUS105 = nil
      tree_for_MINUS106 = nil

      begin
        # at line 326:5: ( PLUS | MINUS )
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


          # at line 327:5: PLUS
          __PLUS105__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_sign_1659 )
          if @state.backtracking == 0

            tree_for_PLUS105 = @adaptor.create_with_payload( __PLUS105__ )
            @adaptor.add_child( root_0, tree_for_PLUS105 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[SIGN] ") 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 328:7: MINUS
          __MINUS106__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_sign_1669 )
          if @state.backtracking == 0

            tree_for_MINUS106 = @adaptor.create_with_payload( __MINUS106__ )
            @adaptor.add_child( root_0, tree_for_MINUS106 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[SIGN] ") 
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
    # 331:1: varcte : ( ID idvarcte | CTEI | CTEF | CTES | CTEB );
    # 
    def varcte
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = VarcteReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID107__ = nil
      __CTEI109__ = nil
      __CTEF110__ = nil
      __CTES111__ = nil
      __CTEB112__ = nil
      idvarcte108 = nil

      tree_for_ID107 = nil
      tree_for_CTEI109 = nil
      tree_for_CTEF110 = nil
      tree_for_CTES111 = nil
      tree_for_CTEB112 = nil

      begin
        # at line 331:7: ( ID idvarcte | CTEI | CTEF | CTES | CTEB )
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


          # at line 332:5: ID idvarcte
          __ID107__ = match( ID, TOKENS_FOLLOWING_ID_IN_varcte_1687 )
          if @state.backtracking == 0

            tree_for_ID107 = @adaptor.create_with_payload( __ID107__ )
            @adaptor.add_child( root_0, tree_for_ID107 )

          end
          @state.following.push( TOKENS_FOLLOWING_idvarcte_IN_varcte_1689 )
          idvarcte108 = idvarcte
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, idvarcte108.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             
                  scope_location = @vars_block_stack.last.scope_location
                  if not $scope_location.nil? and @vars_block_stack.last.procedures.has_key?($scope_location)
                    if @vars_block_stack.last.procedures[$scope_location].local_vars.has_key?(__ID107__.text)
                      @vars_block_stack.last.operations_stack.push(@vars_block_stack.last.procedures[$scope_location].local_vars[__ID107__.text])
                    else 
                      abort "Variable not defined in #{$scope_location}"
                    end
                  else
                    if @vars_block_stack.last.global.has_key?(__ID107__.text)
                      @vars_block_stack.last.operations_stack.push(@vars_block_stack.last.global[__ID107__.text])
                    else
                      abort "Variable not defined in the program: #{__ID107__.text}"
                    end
                  end
                
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 348:7: CTEI
          __CTEI109__ = match( CTEI, TOKENS_FOLLOWING_CTEI_IN_varcte_1699 )
          if @state.backtracking == 0

            tree_for_CTEI109 = @adaptor.create_with_payload( __CTEI109__ )
            @adaptor.add_child( root_0, tree_for_CTEI109 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[VARCTE] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 349:7: CTEF
          __CTEF110__ = match( CTEF, TOKENS_FOLLOWING_CTEF_IN_varcte_1709 )
          if @state.backtracking == 0

            tree_for_CTEF110 = @adaptor.create_with_payload( __CTEF110__ )
            @adaptor.add_child( root_0, tree_for_CTEF110 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[VARCTE] ") 
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 350:7: CTES
          __CTES111__ = match( CTES, TOKENS_FOLLOWING_CTES_IN_varcte_1719 )
          if @state.backtracking == 0

            tree_for_CTES111 = @adaptor.create_with_payload( __CTES111__ )
            @adaptor.add_child( root_0, tree_for_CTES111 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[VARCTE] ") 
            # <-- action
          end

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 351:7: CTEB
          __CTEB112__ = match( CTEB, TOKENS_FOLLOWING_CTEB_IN_varcte_1729 )
          if @state.backtracking == 0

            tree_for_CTEB112 = @adaptor.create_with_payload( __CTEB112__ )
            @adaptor.add_child( root_0, tree_for_CTEB112 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[VARCTE] ") 
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
    # 354:1: idvarcte : ( | llamada | array );
    # 
    def idvarcte
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = IdvarcteReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      llamada113 = nil
      array114 = nil


      begin
        # at line 354:9: ( | llamada | array )
        alt_25 = 3
        case look_25 = @input.peek( 1 )
        when EOF, LT, LE, GT, GE, EQ, NE, AND, OR, RPARENT, RSBRACK, COMMA, SEMICOLON, PLUS, MINUS, TIMES, DIVIDE then alt_25 = 1
        when LPARENT then alt_25 = 2
        when LSBRACK then alt_25 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 25, 0 )
        end
        case alt_25
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 355:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 355:7: llamada
          @state.following.push( TOKENS_FOLLOWING_llamada_IN_idvarcte_1751 )
          llamada113 = llamada
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, llamada113.tree )
          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[IDVARCTE] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 356:7: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_idvarcte_1761 )
          array114 = array
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, array114.tree )
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
    # 359:1: comparacion : ( LT | LE | GT | GE | EQ | NE );
    # 
    def comparacion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = ComparacionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __LT115__ = nil
      __LE116__ = nil
      __GT117__ = nil
      __GE118__ = nil
      __EQ119__ = nil
      __NE120__ = nil

      tree_for_LT115 = nil
      tree_for_LE116 = nil
      tree_for_GT117 = nil
      tree_for_GE118 = nil
      tree_for_EQ119 = nil
      tree_for_NE120 = nil

      begin
        # at line 359:12: ( LT | LE | GT | GE | EQ | NE )
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


          # at line 360:5: LT
          __LT115__ = match( LT, TOKENS_FOLLOWING_LT_IN_comparacion_1779 )
          if @state.backtracking == 0

            tree_for_LT115 = @adaptor.create_with_payload( __LT115__ )
            @adaptor.add_child( root_0, tree_for_LT115 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[COMPARACION] ") 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 361:7: LE
          __LE116__ = match( LE, TOKENS_FOLLOWING_LE_IN_comparacion_1789 )
          if @state.backtracking == 0

            tree_for_LE116 = @adaptor.create_with_payload( __LE116__ )
            @adaptor.add_child( root_0, tree_for_LE116 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[COMPARACION] ") 
            # <-- action
          end

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 362:7: GT
          __GT117__ = match( GT, TOKENS_FOLLOWING_GT_IN_comparacion_1799 )
          if @state.backtracking == 0

            tree_for_GT117 = @adaptor.create_with_payload( __GT117__ )
            @adaptor.add_child( root_0, tree_for_GT117 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[COMPARACION] ") 
            # <-- action
          end

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 363:7: GE
          __GE118__ = match( GE, TOKENS_FOLLOWING_GE_IN_comparacion_1809 )
          if @state.backtracking == 0

            tree_for_GE118 = @adaptor.create_with_payload( __GE118__ )
            @adaptor.add_child( root_0, tree_for_GE118 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[COMPARACION] ") 
            # <-- action
          end

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 364:7: EQ
          __EQ119__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_comparacion_1819 )
          if @state.backtracking == 0

            tree_for_EQ119 = @adaptor.create_with_payload( __EQ119__ )
            @adaptor.add_child( root_0, tree_for_EQ119 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[COMPARACION] ") 
            # <-- action
          end

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 365:7: NE
          __NE120__ = match( NE, TOKENS_FOLLOWING_NE_IN_comparacion_1829 )
          if @state.backtracking == 0

            tree_for_NE120 = @adaptor.create_with_payload( __NE120__ )
            @adaptor.add_child( root_0, tree_for_NE120 )

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
    # 368:1: logico : ( AND | OR );
    # 
    def logico
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = LogicoReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND121__ = nil
      __OR122__ = nil

      tree_for_AND121 = nil
      tree_for_OR122 = nil

      begin
        # at line 368:7: ( AND | OR )
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


          # at line 369:5: AND
          __AND121__ = match( AND, TOKENS_FOLLOWING_AND_IN_logico_1847 )
          if @state.backtracking == 0

            tree_for_AND121 = @adaptor.create_with_payload( __AND121__ )
            @adaptor.add_child( root_0, tree_for_AND121 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[LOGICO] ") 
            # <-- action
          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 370:7: OR
          __OR122__ = match( OR, TOKENS_FOLLOWING_OR_IN_logico_1857 )
          if @state.backtracking == 0

            tree_for_OR122 = @adaptor.create_with_payload( __OR122__ )
            @adaptor.add_child( root_0, tree_for_OR122 )

          end
          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             print("[LOGICO] ") 
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
    # 373:1: retorno : ( | exp );
    # 
    def retorno
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = RetornoReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      exp123 = nil


      begin
        # at line 373:8: ( | exp )
        alt_28 = 2
        look_28_0 = @input.peek( 1 )

        if ( look_28_0 == SEMICOLON )
          alt_28 = 1
        elsif ( look_28_0 == NOT || look_28_0.between?( PLUS, MINUS ) || look_28_0.between?( CTEI, CTEF ) || look_28_0.between?( CTES, CTEB ) || look_28_0 == ID )
          alt_28 = 2
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )

          raise NoViableAlternative( "", 28, 0 )
        end
        case alt_28
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 374:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 374:7: exp
          @state.following.push( TOKENS_FOLLOWING_exp_IN_retorno_1879 )
          exp123 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp123.tree )
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
    # 377:1: condicion : IF LPARENT expresion RPARENT LBRACK est RBRACK elsecondicion ;
    # 
    def condicion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = CondicionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF124__ = nil
      __LPARENT125__ = nil
      __RPARENT127__ = nil
      __LBRACK128__ = nil
      __RBRACK130__ = nil
      expresion126 = nil
      est129 = nil
      elsecondicion131 = nil

      tree_for_IF124 = nil
      tree_for_LPARENT125 = nil
      tree_for_RPARENT127 = nil
      tree_for_LBRACK128 = nil
      tree_for_RBRACK130 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 378:5: IF LPARENT expresion RPARENT LBRACK est RBRACK elsecondicion
        __IF124__ = match( IF, TOKENS_FOLLOWING_IF_IN_condicion_1897 )
        if @state.backtracking == 0

          tree_for_IF124 = @adaptor.create_with_payload( __IF124__ )
          @adaptor.add_child( root_0, tree_for_IF124 )

        end
        __LPARENT125__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_condicion_1899 )
        if @state.backtracking == 0

          tree_for_LPARENT125 = @adaptor.create_with_payload( __LPARENT125__ )
          @adaptor.add_child( root_0, tree_for_LPARENT125 )

        end
        @state.following.push( TOKENS_FOLLOWING_expresion_IN_condicion_1901 )
        expresion126 = expresion
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expresion126.tree )
        end
        __RPARENT127__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_condicion_1903 )
        if @state.backtracking == 0

          tree_for_RPARENT127 = @adaptor.create_with_payload( __RPARENT127__ )
          @adaptor.add_child( root_0, tree_for_RPARENT127 )

        end
        __LBRACK128__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_condicion_1905 )
        if @state.backtracking == 0

          tree_for_LBRACK128 = @adaptor.create_with_payload( __LBRACK128__ )
          @adaptor.add_child( root_0, tree_for_LBRACK128 )

        end
        @state.following.push( TOKENS_FOLLOWING_est_IN_condicion_1907 )
        est129 = est
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, est129.tree )
        end
        __RBRACK130__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_condicion_1909 )
        if @state.backtracking == 0

          tree_for_RBRACK130 = @adaptor.create_with_payload( __RBRACK130__ )
          @adaptor.add_child( root_0, tree_for_RBRACK130 )

        end
        @state.following.push( TOKENS_FOLLOWING_elsecondicion_IN_condicion_1911 )
        elsecondicion131 = elsecondicion
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, elsecondicion131.tree )
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
    # 381:1: elsecondicion : ( | ELSE LBRACK est RBRACK );
    # 
    def elsecondicion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = ElsecondicionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ELSE132__ = nil
      __LBRACK133__ = nil
      __RBRACK135__ = nil
      est134 = nil

      tree_for_ELSE132 = nil
      tree_for_LBRACK133 = nil
      tree_for_RBRACK135 = nil

      begin
        # at line 381:14: ( | ELSE LBRACK est RBRACK )
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


          # at line 382:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 382:7: ELSE LBRACK est RBRACK
          __ELSE132__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_elsecondicion_1933 )
          if @state.backtracking == 0

            tree_for_ELSE132 = @adaptor.create_with_payload( __ELSE132__ )
            @adaptor.add_child( root_0, tree_for_ELSE132 )

          end
          __LBRACK133__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_elsecondicion_1935 )
          if @state.backtracking == 0

            tree_for_LBRACK133 = @adaptor.create_with_payload( __LBRACK133__ )
            @adaptor.add_child( root_0, tree_for_LBRACK133 )

          end
          @state.following.push( TOKENS_FOLLOWING_est_IN_elsecondicion_1937 )
          est134 = est
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, est134.tree )
          end
          __RBRACK135__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_elsecondicion_1939 )
          if @state.backtracking == 0

            tree_for_RBRACK135 = @adaptor.create_with_payload( __RBRACK135__ )
            @adaptor.add_child( root_0, tree_for_RBRACK135 )

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
    # 385:1: escritura : PRINT LPARENT argsescritura RPARENT SEMICOLON ;
    # 
    def escritura
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = EscrituraReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT136__ = nil
      __LPARENT137__ = nil
      __RPARENT139__ = nil
      __SEMICOLON140__ = nil
      argsescritura138 = nil

      tree_for_PRINT136 = nil
      tree_for_LPARENT137 = nil
      tree_for_RPARENT139 = nil
      tree_for_SEMICOLON140 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 386:5: PRINT LPARENT argsescritura RPARENT SEMICOLON
        __PRINT136__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_escritura_1957 )
        if @state.backtracking == 0

          tree_for_PRINT136 = @adaptor.create_with_payload( __PRINT136__ )
          @adaptor.add_child( root_0, tree_for_PRINT136 )

        end
        __LPARENT137__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_escritura_1959 )
        if @state.backtracking == 0

          tree_for_LPARENT137 = @adaptor.create_with_payload( __LPARENT137__ )
          @adaptor.add_child( root_0, tree_for_LPARENT137 )

        end
        @state.following.push( TOKENS_FOLLOWING_argsescritura_IN_escritura_1961 )
        argsescritura138 = argsescritura
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, argsescritura138.tree )
        end
        __RPARENT139__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_escritura_1963 )
        if @state.backtracking == 0

          tree_for_RPARENT139 = @adaptor.create_with_payload( __RPARENT139__ )
          @adaptor.add_child( root_0, tree_for_RPARENT139 )

        end
        __SEMICOLON140__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_escritura_1965 )
        if @state.backtracking == 0

          tree_for_SEMICOLON140 = @adaptor.create_with_payload( __SEMICOLON140__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON140 )

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
    # 389:1: argsescritura : exp argsescrituraaux ;
    # 
    def argsescritura
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = ArgsescrituraReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      exp141 = nil
      argsescrituraaux142 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 390:5: exp argsescrituraaux
        @state.following.push( TOKENS_FOLLOWING_exp_IN_argsescritura_1983 )
        exp141 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp141.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_argsescrituraaux_IN_argsescritura_1985 )
        argsescrituraaux142 = argsescrituraaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, argsescrituraaux142.tree )
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
    # 393:1: argsescrituraaux : ( | COMMA argsescritura );
    # 
    def argsescrituraaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = ArgsescrituraauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA143__ = nil
      argsescritura144 = nil

      tree_for_COMMA143 = nil

      begin
        # at line 393:17: ( | COMMA argsescritura )
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


          # at line 394:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 394:7: COMMA argsescritura
          __COMMA143__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsescrituraaux_2007 )
          if @state.backtracking == 0

            tree_for_COMMA143 = @adaptor.create_with_payload( __COMMA143__ )
            @adaptor.add_child( root_0, tree_for_COMMA143 )

          end
          @state.following.push( TOKENS_FOLLOWING_argsescritura_IN_argsescrituraaux_2009 )
          argsescritura144 = argsescritura
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, argsescritura144.tree )
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
    # 397:1: ciclo : FOR LPARENT cicloaux SEMICOLON expresion SEMICOLON cicloaux RPARENT LBRACK est RBRACK ;
    # 
    def ciclo
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = CicloReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR145__ = nil
      __LPARENT146__ = nil
      __SEMICOLON148__ = nil
      __SEMICOLON150__ = nil
      __RPARENT152__ = nil
      __LBRACK153__ = nil
      __RBRACK155__ = nil
      cicloaux147 = nil
      expresion149 = nil
      cicloaux151 = nil
      est154 = nil

      tree_for_FOR145 = nil
      tree_for_LPARENT146 = nil
      tree_for_SEMICOLON148 = nil
      tree_for_SEMICOLON150 = nil
      tree_for_RPARENT152 = nil
      tree_for_LBRACK153 = nil
      tree_for_RBRACK155 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 398:5: FOR LPARENT cicloaux SEMICOLON expresion SEMICOLON cicloaux RPARENT LBRACK est RBRACK
        __FOR145__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_ciclo_2027 )
        if @state.backtracking == 0

          tree_for_FOR145 = @adaptor.create_with_payload( __FOR145__ )
          @adaptor.add_child( root_0, tree_for_FOR145 )

        end
        __LPARENT146__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_ciclo_2029 )
        if @state.backtracking == 0

          tree_for_LPARENT146 = @adaptor.create_with_payload( __LPARENT146__ )
          @adaptor.add_child( root_0, tree_for_LPARENT146 )

        end
        @state.following.push( TOKENS_FOLLOWING_cicloaux_IN_ciclo_2031 )
        cicloaux147 = cicloaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, cicloaux147.tree )
        end
        __SEMICOLON148__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_ciclo_2033 )
        if @state.backtracking == 0

          tree_for_SEMICOLON148 = @adaptor.create_with_payload( __SEMICOLON148__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON148 )

        end
        @state.following.push( TOKENS_FOLLOWING_expresion_IN_ciclo_2035 )
        expresion149 = expresion
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expresion149.tree )
        end
        __SEMICOLON150__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_ciclo_2037 )
        if @state.backtracking == 0

          tree_for_SEMICOLON150 = @adaptor.create_with_payload( __SEMICOLON150__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON150 )

        end
        @state.following.push( TOKENS_FOLLOWING_cicloaux_IN_ciclo_2039 )
        cicloaux151 = cicloaux
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, cicloaux151.tree )
        end
        __RPARENT152__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_ciclo_2041 )
        if @state.backtracking == 0

          tree_for_RPARENT152 = @adaptor.create_with_payload( __RPARENT152__ )
          @adaptor.add_child( root_0, tree_for_RPARENT152 )

        end
        __LBRACK153__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_ciclo_2043 )
        if @state.backtracking == 0

          tree_for_LBRACK153 = @adaptor.create_with_payload( __LBRACK153__ )
          @adaptor.add_child( root_0, tree_for_LBRACK153 )

        end
        @state.following.push( TOKENS_FOLLOWING_est_IN_ciclo_2045 )
        est154 = est
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, est154.tree )
        end
        __RBRACK155__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_ciclo_2047 )
        if @state.backtracking == 0

          tree_for_RBRACK155 = @adaptor.create_with_payload( __RBRACK155__ )
          @adaptor.add_child( root_0, tree_for_RBRACK155 )

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
    # 401:1: cicloaux : ( | ID cicloauxx ASSIGN exp );
    # 
    def cicloaux
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = CicloauxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID156__ = nil
      __ASSIGN158__ = nil
      cicloauxx157 = nil
      exp159 = nil

      tree_for_ID156 = nil
      tree_for_ASSIGN158 = nil

      begin
        # at line 401:9: ( | ID cicloauxx ASSIGN exp )
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


          # at line 402:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 402:7: ID cicloauxx ASSIGN exp
          __ID156__ = match( ID, TOKENS_FOLLOWING_ID_IN_cicloaux_2069 )
          if @state.backtracking == 0

            tree_for_ID156 = @adaptor.create_with_payload( __ID156__ )
            @adaptor.add_child( root_0, tree_for_ID156 )

          end
          @state.following.push( TOKENS_FOLLOWING_cicloauxx_IN_cicloaux_2071 )
          cicloauxx157 = cicloauxx
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, cicloauxx157.tree )
          end
          __ASSIGN158__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_cicloaux_2073 )
          if @state.backtracking == 0

            tree_for_ASSIGN158 = @adaptor.create_with_payload( __ASSIGN158__ )
            @adaptor.add_child( root_0, tree_for_ASSIGN158 )

          end
          @state.following.push( TOKENS_FOLLOWING_exp_IN_cicloaux_2075 )
          exp159 = exp
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, exp159.tree )
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
    # 405:1: cicloauxx : ( | array );
    # 
    def cicloauxx
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = CicloauxxReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      array160 = nil


      begin
        # at line 405:10: ( | array )
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


          # at line 406:5: 

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 406:7: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_cicloauxx_2097 )
          array160 = array
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, array160.tree )
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
    # 409:1: lectura : INPUT LPARENT tipo COMMA ID RPARENT SEMICOLON ;
    # 
    def lectura
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = LecturaReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __INPUT161__ = nil
      __LPARENT162__ = nil
      __COMMA164__ = nil
      __ID165__ = nil
      __RPARENT166__ = nil
      __SEMICOLON167__ = nil
      tipo163 = nil

      tree_for_INPUT161 = nil
      tree_for_LPARENT162 = nil
      tree_for_COMMA164 = nil
      tree_for_ID165 = nil
      tree_for_RPARENT166 = nil
      tree_for_SEMICOLON167 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 410:5: INPUT LPARENT tipo COMMA ID RPARENT SEMICOLON
        __INPUT161__ = match( INPUT, TOKENS_FOLLOWING_INPUT_IN_lectura_2115 )
        if @state.backtracking == 0

          tree_for_INPUT161 = @adaptor.create_with_payload( __INPUT161__ )
          @adaptor.add_child( root_0, tree_for_INPUT161 )

        end
        __LPARENT162__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_lectura_2117 )
        if @state.backtracking == 0

          tree_for_LPARENT162 = @adaptor.create_with_payload( __LPARENT162__ )
          @adaptor.add_child( root_0, tree_for_LPARENT162 )

        end
        @state.following.push( TOKENS_FOLLOWING_tipo_IN_lectura_2119 )
        tipo163 = tipo
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, tipo163.tree )
        end
        __COMMA164__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_lectura_2121 )
        if @state.backtracking == 0

          tree_for_COMMA164 = @adaptor.create_with_payload( __COMMA164__ )
          @adaptor.add_child( root_0, tree_for_COMMA164 )

        end
        __ID165__ = match( ID, TOKENS_FOLLOWING_ID_IN_lectura_2123 )
        if @state.backtracking == 0

          tree_for_ID165 = @adaptor.create_with_payload( __ID165__ )
          @adaptor.add_child( root_0, tree_for_ID165 )

        end
        __RPARENT166__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_lectura_2125 )
        if @state.backtracking == 0

          tree_for_RPARENT166 = @adaptor.create_with_payload( __RPARENT166__ )
          @adaptor.add_child( root_0, tree_for_RPARENT166 )

        end
        __SEMICOLON167__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_lectura_2127 )
        if @state.backtracking == 0

          tree_for_SEMICOLON167 = @adaptor.create_with_payload( __SEMICOLON167__ )
          @adaptor.add_child( root_0, tree_for_SEMICOLON167 )

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
    # 413:1: main : MAIN LPARENT RPARENT LBRACK var est RBRACK ;
    # 
    def main
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )
      return_value = MainReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MAIN168__ = nil
      __LPARENT169__ = nil
      __RPARENT170__ = nil
      __LBRACK171__ = nil
      __RBRACK174__ = nil
      var172 = nil
      est173 = nil

      tree_for_MAIN168 = nil
      tree_for_LPARENT169 = nil
      tree_for_RPARENT170 = nil
      tree_for_LBRACK171 = nil
      tree_for_RBRACK174 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 414:5: MAIN LPARENT RPARENT LBRACK var est RBRACK
        __MAIN168__ = match( MAIN, TOKENS_FOLLOWING_MAIN_IN_main_2145 )
        if @state.backtracking == 0

          tree_for_MAIN168 = @adaptor.create_with_payload( __MAIN168__ )
          @adaptor.add_child( root_0, tree_for_MAIN168 )

        end
        __LPARENT169__ = match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_main_2147 )
        if @state.backtracking == 0

          tree_for_LPARENT169 = @adaptor.create_with_payload( __LPARENT169__ )
          @adaptor.add_child( root_0, tree_for_LPARENT169 )

        end
        __RPARENT170__ = match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_main_2149 )
        if @state.backtracking == 0

          tree_for_RPARENT170 = @adaptor.create_with_payload( __RPARENT170__ )
          @adaptor.add_child( root_0, tree_for_RPARENT170 )

        end
        __LBRACK171__ = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_main_2151 )
        if @state.backtracking == 0

          tree_for_LBRACK171 = @adaptor.create_with_payload( __LBRACK171__ )
          @adaptor.add_child( root_0, tree_for_LBRACK171 )

        end
        @state.following.push( TOKENS_FOLLOWING_var_IN_main_2153 )
        var172 = var
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, var172.tree )
        end
        @state.following.push( TOKENS_FOLLOWING_est_IN_main_2155 )
        est173 = est
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, est173.tree )
        end
        __RBRACK174__ = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_main_2157 )
        if @state.backtracking == 0

          tree_for_RBRACK174 = @adaptor.create_with_payload( __RBRACK174__ )
          @adaptor.add_child( root_0, tree_for_RBRACK174 )

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
    # syntactic predicate synpred1_Simple
    # 
    # (in Simple.g)
    # 159:5: synpred1_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred1_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )

      # at line 159:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )

    end
    # 
    # syntactic predicate synpred2_Simple
    # 
    # (in Simple.g)
    # 160:5: synpred2_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred2_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )

      # at line 160:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )

    end
    # 
    # syntactic predicate synpred7_Simple
    # 
    # (in Simple.g)
    # 175:5: synpred7_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred7_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )

      # at line 175:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )

    end
    # 
    # syntactic predicate synpred8_Simple
    # 
    # (in Simple.g)
    # 176:5: synpred8_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred8_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )

      # at line 176:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 55 )

    end
    # 
    # syntactic predicate synpred9_Simple
    # 
    # (in Simple.g)
    # 180:5: synpred9_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred9_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )

      # at line 180:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 56 )

    end
    # 
    # syntactic predicate synpred10_Simple
    # 
    # (in Simple.g)
    # 181:5: synpred10_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred10_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )

      # at line 181:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 57 )

    end
    # 
    # syntactic predicate synpred11_Simple
    # 
    # (in Simple.g)
    # 185:5: synpred11_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred11_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 58 )

      # at line 185:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 58 )

    end
    # 
    # syntactic predicate synpred12_Simple
    # 
    # (in Simple.g)
    # 186:5: synpred12_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred12_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 59 )

      # at line 186:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 59 )

    end
    # 
    # syntactic predicate synpred13_Simple
    # 
    # (in Simple.g)
    # 190:5: synpred13_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred13_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 60 )

      # at line 190:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 60 )

    end
    # 
    # syntactic predicate synpred14_Simple
    # 
    # (in Simple.g)
    # 191:5: synpred14_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred14_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 61 )

      # at line 191:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 61 )

    end
    # 
    # syntactic predicate synpred18_Simple
    # 
    # (in Simple.g)
    # 202:5: synpred18_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred18_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 65 )

      # at line 202:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 65 )

    end
    # 
    # syntactic predicate synpred19_Simple
    # 
    # (in Simple.g)
    # 203:5: synpred19_Simple : ;
    # 
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    # 
    def synpred19_Simple
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 66 )

      # at line 203:5: 

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 66 )

    end


    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA1 < ANTLR3::DFA
      EOT = unpack( 11, -1 )
      EOF = unpack( 11, -1 )
      MIN = unpack( 1, 4, 7, 0, 3, -1 )
      MAX = unpack( 1, 49, 7, 0, 3, -1 )
      ACCEPT = unpack( 8, -1, 1, 3, 1, 1, 1, 2 )
      SPECIAL = unpack( 1, -1, 1, 5, 1, 4, 1, 2, 1, 1, 1, 0, 1, 3, 1, 6, 
                        3, -1 )
      TRANSITION = [
        unpack( 5, 8, 1, 1, 1, -1, 1, 2, 1, -1, 1, 6, 1, 4, 1, -1, 1, 5, 
                1, 7, 31, -1, 1, 3 ),
        unpack( 1, -1 ),
        unpack( 1, -1 ),
        unpack( 1, -1 ),
        unpack( 1, -1 ),
        unpack( 1, -1 ),
        unpack( 1, -1 ),
        unpack( 1, -1 ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 1
      

      def description
        <<-'__dfa_description__'.strip!
          158:1: var returns [vars_array] : ( | | single_var= variables vars= var );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa1 = DFA1.new( self, 1 ) do |s|
        case s
        when 0
          look_1_5 = @input.peek
          index_1_5 = @input.index
          @input.rewind( @input.last_marker, false )
          s = -1
          if ( syntactic_predicate?( :synpred1_Simple ) )
            s = 9
          elsif ( syntactic_predicate?( :synpred2_Simple ) )
            s = 10
          end
           
          @input.seek( index_1_5 )

        when 1
          look_1_4 = @input.peek
          index_1_4 = @input.index
          @input.rewind( @input.last_marker, false )
          s = -1
          if ( syntactic_predicate?( :synpred1_Simple ) )
            s = 9
          elsif ( syntactic_predicate?( :synpred2_Simple ) )
            s = 10
          end
           
          @input.seek( index_1_4 )

        when 2
          look_1_3 = @input.peek
          index_1_3 = @input.index
          @input.rewind( @input.last_marker, false )
          s = -1
          if ( syntactic_predicate?( :synpred1_Simple ) )
            s = 9
          elsif ( syntactic_predicate?( :synpred2_Simple ) )
            s = 10
          end
           
          @input.seek( index_1_3 )

        when 3
          look_1_6 = @input.peek
          index_1_6 = @input.index
          @input.rewind( @input.last_marker, false )
          s = -1
          if ( syntactic_predicate?( :synpred1_Simple ) )
            s = 9
          elsif ( syntactic_predicate?( :synpred2_Simple ) )
            s = 10
          end
           
          @input.seek( index_1_6 )

        when 4
          look_1_2 = @input.peek
          index_1_2 = @input.index
          @input.rewind( @input.last_marker, false )
          s = -1
          if ( syntactic_predicate?( :synpred1_Simple ) )
            s = 9
          elsif ( syntactic_predicate?( :synpred2_Simple ) )
            s = 10
          end
           
          @input.seek( index_1_2 )

        when 5
          look_1_1 = @input.peek
          index_1_1 = @input.index
          @input.rewind( @input.last_marker, false )
          s = -1
          if ( syntactic_predicate?( :synpred1_Simple ) )
            s = 9
          elsif ( syntactic_predicate?( :synpred2_Simple ) )
            s = 10
          end
           
          @input.seek( index_1_1 )

        when 6
          look_1_7 = @input.peek
          index_1_7 = @input.index
          @input.rewind( @input.last_marker, false )
          s = -1
          if ( syntactic_predicate?( :synpred1_Simple ) )
            s = 9
          elsif ( syntactic_predicate?( :synpred2_Simple ) )
            s = 10
          end
           
          @input.seek( index_1_7 )

        end
        
        if s < 0
          @state.backtracking > 0 and raise ANTLR3::Error::BacktrackingFailed
          nva = ANTLR3::Error::NoViableAlternative.new( @dfa1.description, 1, s, input )
          @dfa1.error( nva )
          raise nva
        end
        
        s
      end

    end
    TOKENS_FOLLOWING_programa_IN_vars_block_585 = Set[ 1 ]
    TOKENS_FOLLOWING_var_IN_programa_602 = Set[ 9, 11 ]
    TOKENS_FOLLOWING_func_IN_programa_606 = Set[ 9, 11 ]
    TOKENS_FOLLOWING_main_IN_programa_608 = Set[ 1 ]
    TOKENS_FOLLOWING_variables_IN_var_641 = Set[ 4, 5, 6, 7, 8 ]
    TOKENS_FOLLOWING_var_IN_var_645 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_variables_666 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_668 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_assignint_IN_variables_672 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_674 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_variables_684 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_686 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_assignfloat_IN_variables_690 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_692 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_variables_702 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_704 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_assignstring_IN_variables_708 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_710 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_variables_720 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_722 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_assignboolean_IN_variables_726 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_728 = Set[ 1 ]
    TOKENS_FOLLOWING_ARRAY_IN_variables_738 = Set[ 4, 5, 6, 7 ]
    TOKENS_FOLLOWING_tipo_IN_variables_742 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_variables_744 = Set[ 37 ]
    TOKENS_FOLLOWING_COLON_IN_variables_746 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_variables_748 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_variables_750 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignint_782 = Set[ 43 ]
    TOKENS_FOLLOWING_CTEI_IN_assignint_784 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignfloat_815 = Set[ 44 ]
    TOKENS_FOLLOWING_CTEF_IN_assignfloat_817 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignstring_849 = Set[ 46 ]
    TOKENS_FOLLOWING_CTES_IN_assignstring_851 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignboolean_882 = Set[ 47 ]
    TOKENS_FOLLOWING_CTEB_IN_assignboolean_884 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_tipo_906 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_tipo_916 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_tipo_926 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_tipo_936 = Set[ 1 ]
    TOKENS_FOLLOWING_funcion_IN_func_969 = Set[ 11 ]
    TOKENS_FOLLOWING_func_IN_func_973 = Set[ 1 ]
    TOKENS_FOLLOWING_FUNCTION_IN_funcion_994 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_funcion_996 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_funcion_1000 = Set[ 4, 5, 6, 7, 31 ]
    TOKENS_FOLLOWING_argumentos_IN_funcion_1004 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_funcion_1006 = Set[ 37 ]
    TOKENS_FOLLOWING_COLON_IN_funcion_1008 = Set[ 4, 5, 6, 7, 10 ]
    TOKENS_FOLLOWING_retornofunc_IN_funcion_1012 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_funcion_1014 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_var_IN_funcion_1018 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_funcion_1020 = Set[ 12 ]
    TOKENS_FOLLOWING_RETURN_IN_funcion_1022 = Set[ 25, 36, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_retorno_IN_funcion_1024 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_funcion_1026 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_funcion_1028 = Set[ 1 ]
    TOKENS_FOLLOWING_tipo_IN_argumentos_1055 = Set[ 35, 49 ]
    TOKENS_FOLLOWING_ref_IN_argumentos_1057 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_argumentos_1059 = Set[ 34 ]
    TOKENS_FOLLOWING_argumentoaux_IN_argumentos_1063 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argumentoaux_1088 = Set[ 4, 5, 6, 7 ]
    TOKENS_FOLLOWING_tipo_IN_argumentoaux_1092 = Set[ 35, 49 ]
    TOKENS_FOLLOWING_ref_IN_argumentoaux_1094 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_argumentoaux_1096 = Set[ 34 ]
    TOKENS_FOLLOWING_argumentoaux_IN_argumentoaux_1100 = Set[ 1 ]
    TOKENS_FOLLOWING_REF_IN_ref_1122 = Set[ 1 ]
    TOKENS_FOLLOWING_VOID_IN_retornofunc_1143 = Set[ 1 ]
    TOKENS_FOLLOWING_tipo_IN_retornofunc_1155 = Set[ 1 ]
    TOKENS_FOLLOWING_estatutos_IN_est_1173 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_estaux_IN_est_1175 = Set[ 1 ]
    TOKENS_FOLLOWING_estatutos_IN_estaux_1197 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_estaux_IN_estaux_1199 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_estatutos_1217 = Set[ 18, 30, 32 ]
    TOKENS_FOLLOWING_idestatutos_IN_estatutos_1219 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_estatutos_1221 = Set[ 1 ]
    TOKENS_FOLLOWING_condicion_IN_estatutos_1231 = Set[ 1 ]
    TOKENS_FOLLOWING_escritura_IN_estatutos_1241 = Set[ 1 ]
    TOKENS_FOLLOWING_ciclo_IN_estatutos_1251 = Set[ 1 ]
    TOKENS_FOLLOWING_lectura_IN_estatutos_1261 = Set[ 1 ]
    TOKENS_FOLLOWING_llamada_IN_idestatutos_1279 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_idestatutos_1289 = Set[ 18 ]
    TOKENS_FOLLOWING_ASSIGN_IN_idestatutos_1291 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_idestatutos_1293 = Set[ 1 ]
    TOKENS_FOLLOWING_ASSIGN_IN_idestatutos_1303 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_idestatutos_1305 = Set[ 1 ]
    TOKENS_FOLLOWING_LPARENT_IN_llamada_1323 = Set[ 25, 31, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_llamadaargs_IN_llamada_1325 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_llamada_1327 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_llamadaargs_1349 = Set[ 34 ]
    TOKENS_FOLLOWING_llamadaargsaux_IN_llamadaargs_1351 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_llamadaargsaux_1373 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_llamadaargsaux_1375 = Set[ 34 ]
    TOKENS_FOLLOWING_llamadaargsaux_IN_llamadaargsaux_1377 = Set[ 1 ]
    TOKENS_FOLLOWING_LSBRACK_IN_array_1395 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_array_1397 = Set[ 33 ]
    TOKENS_FOLLOWING_RSBRACK_IN_array_1399 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_expresion_1417 = Set[ 19, 20, 21, 22, 23, 24, 26, 27 ]
    TOKENS_FOLLOWING_expresionaux_IN_expresion_1419 = Set[ 1 ]
    TOKENS_FOLLOWING_comparacion_IN_expresionaux_1441 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_expresionaux_1443 = Set[ 1 ]
    TOKENS_FOLLOWING_logico_IN_expresionaux_1453 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_expresionaux_1455 = Set[ 1 ]
    TOKENS_FOLLOWING_termino_IN_exp_1473 = Set[ 38, 39 ]
    TOKENS_FOLLOWING_expaux_IN_exp_1475 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_expaux_1497 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_expaux_1499 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expaux_1509 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_expaux_1511 = Set[ 1 ]
    TOKENS_FOLLOWING_factor_IN_termino_1529 = Set[ 40, 41 ]
    TOKENS_FOLLOWING_terminoaux_IN_termino_1531 = Set[ 1 ]
    TOKENS_FOLLOWING_TIMES_IN_terminoaux_1553 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_termino_IN_terminoaux_1555 = Set[ 1 ]
    TOKENS_FOLLOWING_DIVIDE_IN_terminoaux_1565 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_termino_IN_terminoaux_1567 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_factor_1585 = Set[ 25, 30, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_notfactor_IN_factor_1587 = Set[ 1 ]
    TOKENS_FOLLOWING_sign_IN_factor_1597 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_varcte_IN_factor_1599 = Set[ 1 ]
    TOKENS_FOLLOWING_varcte_IN_factor_1609 = Set[ 1 ]
    TOKENS_FOLLOWING_LPARENT_IN_notfactor_1627 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_notfactor_1629 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_notfactor_1631 = Set[ 1 ]
    TOKENS_FOLLOWING_varcte_IN_notfactor_1641 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_sign_1659 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_sign_1669 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_varcte_1687 = Set[ 30, 32 ]
    TOKENS_FOLLOWING_idvarcte_IN_varcte_1689 = Set[ 1 ]
    TOKENS_FOLLOWING_CTEI_IN_varcte_1699 = Set[ 1 ]
    TOKENS_FOLLOWING_CTEF_IN_varcte_1709 = Set[ 1 ]
    TOKENS_FOLLOWING_CTES_IN_varcte_1719 = Set[ 1 ]
    TOKENS_FOLLOWING_CTEB_IN_varcte_1729 = Set[ 1 ]
    TOKENS_FOLLOWING_llamada_IN_idvarcte_1751 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_idvarcte_1761 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_comparacion_1779 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_comparacion_1789 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_comparacion_1799 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_comparacion_1809 = Set[ 1 ]
    TOKENS_FOLLOWING_EQ_IN_comparacion_1819 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_comparacion_1829 = Set[ 1 ]
    TOKENS_FOLLOWING_AND_IN_logico_1847 = Set[ 1 ]
    TOKENS_FOLLOWING_OR_IN_logico_1857 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_retorno_1879 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_condicion_1897 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_condicion_1899 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_condicion_1901 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_condicion_1903 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_condicion_1905 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_condicion_1907 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_condicion_1909 = Set[ 15 ]
    TOKENS_FOLLOWING_elsecondicion_IN_condicion_1911 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_elsecondicion_1933 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_elsecondicion_1935 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_elsecondicion_1937 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_elsecondicion_1939 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_escritura_1957 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_escritura_1959 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_argsescritura_IN_escritura_1961 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_escritura_1963 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_escritura_1965 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_argsescritura_1983 = Set[ 34 ]
    TOKENS_FOLLOWING_argsescrituraaux_IN_argsescritura_1985 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsescrituraaux_2007 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_argsescritura_IN_argsescrituraaux_2009 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_ciclo_2027 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_ciclo_2029 = Set[ 36, 49 ]
    TOKENS_FOLLOWING_cicloaux_IN_ciclo_2031 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_ciclo_2033 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_expresion_IN_ciclo_2035 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_ciclo_2037 = Set[ 31, 49 ]
    TOKENS_FOLLOWING_cicloaux_IN_ciclo_2039 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_ciclo_2041 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_ciclo_2043 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_ciclo_2045 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_ciclo_2047 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_cicloaux_2069 = Set[ 18, 32 ]
    TOKENS_FOLLOWING_cicloauxx_IN_cicloaux_2071 = Set[ 18 ]
    TOKENS_FOLLOWING_ASSIGN_IN_cicloaux_2073 = Set[ 25, 38, 39, 43, 44, 46, 47, 49 ]
    TOKENS_FOLLOWING_exp_IN_cicloaux_2075 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_cicloauxx_2097 = Set[ 1 ]
    TOKENS_FOLLOWING_INPUT_IN_lectura_2115 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_lectura_2117 = Set[ 4, 5, 6, 7 ]
    TOKENS_FOLLOWING_tipo_IN_lectura_2119 = Set[ 34 ]
    TOKENS_FOLLOWING_COMMA_IN_lectura_2121 = Set[ 49 ]
    TOKENS_FOLLOWING_ID_IN_lectura_2123 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_lectura_2125 = Set[ 36 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_lectura_2127 = Set[ 1 ]
    TOKENS_FOLLOWING_MAIN_IN_main_2145 = Set[ 30 ]
    TOKENS_FOLLOWING_LPARENT_IN_main_2147 = Set[ 31 ]
    TOKENS_FOLLOWING_RPARENT_IN_main_2149 = Set[ 28 ]
    TOKENS_FOLLOWING_LBRACK_IN_main_2151 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_var_IN_main_2153 = Set[ 4, 5, 6, 7, 8, 13, 14, 16, 17, 49 ]
    TOKENS_FOLLOWING_est_IN_main_2155 = Set[ 29 ]
    TOKENS_FOLLOWING_RBRACK_IN_main_2157 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

