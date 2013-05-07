class Memory 
  constructor: (memory) ->
    @int_count = Math.floor(memory["ic"])
    @integers = new Array(@int_count)
    @int_init_addr = Math.floor(memory["iia"])
    @float_count = Math.floor(memory["fc"])
    @floats = new Array(@float_count)
    @float_init_addr = Math.floor(memory["fia"])
    @boolean_count = Math.floor(memory["bc"])
    @booleans = new Array(@boolean_count)
    @boolean_init_addr = Math.floor(memory["bia"])
    @string_count = Math.floor(memory["sc"])
    @strings = new Array(@string_count)
    @string_init_addr = Math.floor(memory["sia"])

  searchAddress : (address) ->
      address = Math.floor(address)
      return true  if address >= @int_init_addr and address <= (@string_init_addr + @string_count)
      false

  getValue : (address) ->
    address = Math.floor(address)
    if address >= @int_init_addr and address <= (@int_init_addr + @int_count)
      @integers[address - @int_init_addr]
    else if address >= @float_init_addr and address <= (@float_init_addr + @float_count)
      @floats[address - @float_init_addr]
    else if address >= @boolean_init_addr and address <= (@boolean_init_addr + @boolean_count)
      @booleans[address - @boolean_init_addr]
    else
      @strings[address - @string_init_addr]

  setValue : (address, value) ->
    address = Math.floor(address)
    if address >= @int_init_addr and address <= (@int_init_addr + @int_count)
      @integers[address - @int_init_addr] = value
    else if address >= @float_init_addr and address <= (@float_init_addr + @float_count)
      @floats[address - @float_init_addr] = value
    else if address >= @boolean_init_addr and address <= (@boolean_init_addr + @boolean_count)
      @booleans[address - @boolean_init_addr] = value
    else
      @strings[address - @string_init_addr] = value

  initial_address : ->
    @int_init_addr

class LocalMemory 

  constructor : (normal, temporal) ->
    @normal = new Memory(normal)
    @temporal = new Memory(normal)
    @getValue = (address) ->
      address = Math.floor(address)
      if address < @temporal.initial_address()
        @normal.getValue address
      else
        @temporal.getValue address

  setValue : (address, value) ->
    address = Math.floor(address)
    if address < @temporal.initial_address()
      @normal.setValue address, value
    else
      @temporal.setValue address, value

class Stack

  constructor :->
    @stack = new Array()

  push : (value) ->
      @stack.push value

  pop : ->
    @stack.pop()

  look : ->
    return @stack[@stack.length - 1]  if @stack.length > 0
    `undefined`

getValueForAddress = (address) ->
  if address < global.local_memory.normal.initial_address()
    global.global_memory.getValue address
  else if address < global.const_memory.initial_address()
    global.local_memory.getValue address
  else if address < global.pointers_memory.initial_address()
    global.const_memory.getValue address
  else
    new_address = global.pointers_memory.getValue(address)
    getValueForAddress new_address

setValueForAddress = (address, value) ->
  if address < global.local_memory.normal.initial_address()
    global.global_memory.setValue address, value
  else if address < global.const_memory.initial_address()
    global.local_memory.setValue address, value
  else if address >= global.pointers_memory.initial_address()
    new_address = global.pointers_memory.getValue(address)
    setValueForAddress new_address, value

runProgram = ->
  while global.line_number < global.quadruples.length
    global.line = global.quadruples[global.line_number].split(" ")
    global.op = parseInt(global.line[0])
    switch global.op
      when 0, 1, 2, 3, 4, 5, 6
        global.dest = parseInt(global.line[3])
        global.line_number = global.dest
      when 7
        global.op1 = parseInt(global.line[1])
        global.dest = parseInt(global.line[3])
        value = getValueForAddress(global.op1)
        unless value
          global.line_number = global.dest
        else
          global.line_number++
      when 8
        global.op1 = parseInt(global.line[1])
        global.dest = parseInt(global.line[3])
        value = getValueForAddress(global.op1)
        if value
          global.line_number = global.dest
        else
          global.line_number++
      when 9
        global.op1 = parseInt(global.line[1])
        global.dest = parseInt(global.line[3])
        value = getValueForAddress(global.op1)
        setValueForAddress global.dest, value
        global.line_number++
      when 10
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value1 = getValueForAddress(global.op1)
        value2 = getValueForAddress(global.op2)
        result = (value1 < value2)
        setValueForAddress global.dest, result
        global.line_number++
      when 11
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value1 = getValueForAddress(global.op1)
        value2 = getValueForAddress(global.op2)
        result = (value1 <= value2)
        setValueForAddress global.dest, result
        global.line_number++
      when 12
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value1 = getValueForAddress(global.op1)
        value2 = getValueForAddress(global.op2)
        result = (value1 > value2)
        setValueForAddress global.dest, result
        global.line_number++
      when 13
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value1 = getValueForAddress(global.op1)
        value2 = getValueForAddress(global.op2)
        result = (value1 >= value2)
        setValueForAddress global.dest, result
        global.line_number++
      when 14
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value1 = getValueForAddress(global.op1)
        value2 = getValueForAddress(global.op2)
        result = (value1 is value2)
        setValueForAddress global.dest, result
        global.line_number++
      when 15
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value1 = getValueForAddress(global.op1)
        value2 = getValueForAddress(global.op2)
        result = (value1 isnt value2)
        setValueForAddress global.dest, result
        global.line_number++
      when 16
        global.op1 = parseInt(global.line[1])
        global.dest = parseInt(global.line[3])
        value = getValueForAddress(global.op1)
        result = (not value)
        setValueForAddress global.dest, result
        global.line_number++
      when 17
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value1 = getValueForAddress(global.op1)
        value2 = getValueForAddress(global.op2)
        result = (value1 and value2)
        setValueForAddress global.dest, result
        global.line_number++
      when 18
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value1 = getValueForAddress(global.op1)
        value2 = getValueForAddress(global.op2)
        result = (value1 or value2)
        setValueForAddress global.dest, result
        global.line_number++
      when 19
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value1 = getValueForAddress(global.op1)
        value2 = getValueForAddress(global.op2)
        result = (value1 + value2)
        setValueForAddress global.dest, result
        global.line_number++
      when 20
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value1 = getValueForAddress(global.op1)
        value2 = getValueForAddress(global.op2)
        result = (value1 - value2)
        setValueForAddress global.dest, result
        global.line_number++
      when 21
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value1 = getValueForAddress(global.op1)
        value2 = getValueForAddress(global.op2)
        result = (value1 * value2)
        setValueForAddress global.dest, result
        global.line_number++
      when 22
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value1 = getValueForAddress(global.op1)
        value2 = getValueForAddress(global.op2)
        if value2 is 0
          throw new Error("Cero division!")
        else
          result = (value1 / value2)
        setValueForAddress global.dest, result
        global.line_number++
      when 23
        unless global.era is `undefined`
          global.stack_proc_names.push global.proc_name
          global.stack_era.push global.era
        global.stack_ref.push "|"
        global.op1 = global.line[1]
        global.stack_proc_names.push global.proc_name  unless global.proc_name is `undefined`
        global.proc_name = global.op1
        normal = global.procedures[global.op1]["memory"]["normal"]
        temporal = global.procedures[global.op1]["memory"]["temporal"]
        pointers_dic = global.procedures[global.op1]["memory"]["pointers"]
        global.era = [ new LocalMemory(normal, temporal), new Memory(pointers_dic) ]
        global.line_number++
      when 24
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        id = global.procedures[global.proc_name]["args"][global.dest]["id"]
        address = global.procedures[global.proc_name]["local_vars"][id]["value"]
        if global.op2 is 0
          value = getValueForAddress(global.op1)
          global.era[0].setValue address, value
        else if global.op2 is 1
          value = getValueForAddress(global.op1)
          global.era[0].setValue address, value
          global.stack_ref.push global.op1
        else if global.op2 is 2
          size = global.procedures[global.proc_name]["local_vars"][id]["size"]
          i = 0

          while i < size
            value = getValueForAddress(global.op1)
            global.era[0].setValue address, value
            global.stack_ref.push global.op1
            address++
            global.op1++
            i++
        global.line_number++
      when 25
        global.stack_line.push global.line_number + 1
        global.stack_memory.push global.local_memory
        global.stack_pointers.push global.pointers_memory
        global.local_memory = global.era[0]
        global.pointers_memory = global.era[1]
        global.era = global.stack_era.pop()
        global.dest = parseInt(global.line[3])
        global.line_number = global.dest
      when 26
        args = global.procedures[global.proc_name]["args"]
        i = 0

        while i < args.length
          if args[i]["ref"]
            id = args[i]["id"]
            if args[i]["array"]
              size = args[i]["size"]
              address = global.procedures[global.proc_name]["local_vars"][id]["value"]
              j = 0

              while j < size
                value = getValueForAddress(address)
                global.stack_values.push value
                address++
                j++
            else
              address = global.procedures[global.proc_name]["local_vars"][id]["value"]
              value = getValueForAddress(address)
              global.stack_values.push value
          i++
        global.local_memory = global.stack_memory.pop()
        global.pointers_memory = global.stack_pointers.pop()
        until global.stack_ref.look() is "|"
          address = global.stack_ref.pop()
          value = global.stack_values.pop()
          setValueForAddress address, value
        global.stack_ref.pop()
        global.proc_name = global.stack_proc_names.pop()
        global.line_number = global.stack_line.pop()
      when 27
        global.op1 = parseInt(global.line[1])
        global.dest = parseInt(global.line[3])
        value = getValueForAddress(global.op1)
        setValueForAddress global.dest, value
        global.line_number++
      when 28, 29, 30
        global.dest = parseInt(global.line[3])
        value = getValueForAddress(global.dest)
        global.output += value
        global.line_number++
      when 31
        global.op1 = global.line[1]
        global.dest = parseInt(global.line[3])
        if global.op1 is "int"
          value = parseInt(global.input_array[global.input_index])
        else if global.op1 is "float"
          value = parseFloat(global.input_array[global.input_index])
        else if global.op2 is "boolean"
          value = Boolean(parseInt(global.input_array[global.input_index]))
        else
          value = global.input_array[global.input_index]
        global.input_index++
        setValueForAddress global.dest, value
        global.line_number++
      when 32
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value = getValueForAddress(global.op1)
        throw new Error("Out of bounds!")  if value < global.op2 or value >= global.dest
        global.line_number++
      when 33
        global.op1 = parseInt(global.line[1])
        global.op2 = parseInt(global.line[2])
        global.dest = parseInt(global.line[3])
        value = getValueForAddress(global.op1)
        result = global.op2 + value
        global.pointers_memory.setValue global.dest, result
        global.line_number++
  global.output

setConstValues = (dictionary) ->
  integers = undefined
  floats = undefined
  booleans = undefined
  strings = undefined
  integers = dictionary["i"]
  floats = dictionary["f"]
  booleans = dictionary["b"]
  strings = dictionary["s"]
  for i of integers
    value = parseInt(i)
    global.const_memory.setValue integers[i], value
  for f of floats
    value = parseFloat(f)
    global.const_memory.setValue floats[f], value
  for b of booleans
    global.const_memory.setValue booleans[b], b
  for s of strings
    global.const_memory.setValue strings[s], s

node = (data) ->
  console.log "DATA" + data
  initGlobal()
  global.allText = JSON.parse(data)
  global.const_memory = new Memory(global.allText.const_memory_map)
  setConstValues global.allText.const_memory_values
  global.global_memory = new Memory(global.allText.global_memory_map)
  global.global_vars = global.allText.global_memory_values
  global.procedures = global.allText.functions
  global.quadruples = global.allText.quadruples
  normal = global.procedures["main"]["memory"]["normal"]
  temporal = global.procedures["main"]["memory"]["temporal"]
  pointers_dic = global.procedures["main"]["memory"]["pointers"]
  global.local_memory = new LocalMemory(normal, temporal)
  global.pointers_memory = new Memory(pointers_dic)
  runProgram()

# TODO: Find a way to work without global vars
initGlobal = () ->
  # Global vars declaration
  global.line = ""
  global.procedures = {}
  global.const_memory = {}
  global.global_memory = {}
  global.local_memory = {}
  global.pointers_memory = {}
  global.op = ""
  global.op1 = ""
  global.op2 = ""
  global.dest = ""
  global.proc_name = ""
  global.global_vars = {}
  global.line_number = 0
  global.input_index = 0
  global.quadruples = new Array()
  global.stack_ref = new Stack()
  global.stack_memory = new Stack()
  global.stack_line = new Stack()
  global.stack_era = new Stack()
  global.stack_proc_names = new Stack()
  global.stack_values = new Stack()
  global.stack_pointers = new Stack()
  global.input_array = undefined
  global.era = undefined
  global.allText = ""
  global.output = ""

exports.node = node
