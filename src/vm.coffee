Memory = (memory) ->
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
  @searchAddress = (address) ->
    address = Math.floor(address)
    return true  if address >= @int_init_addr and address <= (@string_init_addr + @string_count)
    false

  @getValue = (address) ->
    address = Math.floor(address)
    if address >= @int_init_addr and address <= (@int_init_addr + @int_count)
      @integers[address - @int_init_addr]
    else if address >= @float_init_addr and address <= (@float_init_addr + @float_count)
      @floats[address - @float_init_addr]
    else if address >= @boolean_init_addr and address <= (@boolean_init_addr + @boolean_count)
      @booleans[address - @boolean_init_addr]
    else
      @strings[address - @string_init_addr]

  @setValue = (address, value) ->
    address = Math.floor(address)
    if address >= @int_init_addr and address <= (@int_init_addr + @int_count)
      @integers[address - @int_init_addr] = value
    else if address >= @float_init_addr and address <= (@float_init_addr + @float_count)
      @floats[address - @float_init_addr] = value
    else if address >= @boolean_init_addr and address <= (@boolean_init_addr + @boolean_count)
      @booleans[address - @boolean_init_addr] = value
    else
      @strings[address - @string_init_addr] = value

  @initial_address = ->
    @int_init_addr
LocalMemory = (normal, temporal) ->
  @normal = new Memory(normal)
  @temporal = new Memory(normal)
  @getValue = (address) ->
    address = Math.floor(address)
    if address < @temporal.initial_address()
      @normal.getValue address
    else
      @temporal.getValue address

  @setValue = (address, value) ->
    address = Math.floor(address)
    if address < @temporal.initial_address()
      @normal.setValue address, value
    else
      @temporal.setValue address, value
getValueForAddress = (address) ->
  if address < local_memory.normal.initial_address()
    global_memory.getValue address
  else if address < const_memory.initial_address()
    local_memory.getValue address
  else if address < pointers_memory.initial_address()
    const_memory.getValue address
  else
    new_address = pointers_memory.getValue(address)
    getValueForAddress new_address
setValueForAddress = (address, value) ->
  if address < local_memory.normal.initial_address()
    global_memory.setValue address, value
  else if address < const_memory.initial_address()
    local_memory.setValue address, value
  else if address >= pointers_memory.initial_address()
    new_address = pointers_memory.getValue(address)
    setValueForAddress new_address, value
Stack = ->
  @stack = new Array()
  @push = (value) ->
    @stack.push value

  @pop = ->
    @stack.pop()

  @look = ->
    return @stack[@stack.length - 1]  if @stack.length > 0
    `undefined`
runProgram = ->
  while line_number < quadruples.length
    line = quadruples[line_number].split(" ")
    op = parseInt(line[0])
    switch op
      when 0, 1
    , 2
    , 3
    , 4
    , 5
    , 6
        dest = parseInt(line[3])
        line_number = dest
      when 7
        op1 = parseInt(line[1])
        dest = parseInt(line[3])
        value = getValueForAddress(op1)
        unless value
          line_number = dest
        else
          line_number++
      when 8
        op1 = parseInt(line[1])
        dest = parseInt(line[3])
        value = getValueForAddress(op1)
        if value
          line_number = dest
        else
          line_number++
      when 9
        op1 = parseInt(line[1])
        dest = parseInt(line[3])
        value = getValueForAddress(op1)
        setValueForAddress dest, value
        line_number++
      when 10
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value1 = getValueForAddress(op1)
        value2 = getValueForAddress(op2)
        result = (value1 < value2)
        setValueForAddress dest, result
        line_number++
      when 11
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value1 = getValueForAddress(op1)
        value2 = getValueForAddress(op2)
        result = (value1 <= value2)
        setValueForAddress dest, result
        line_number++
      when 12
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value1 = getValueForAddress(op1)
        value2 = getValueForAddress(op2)
        result = (value1 > value2)
        setValueForAddress dest, result
        line_number++
      when 13
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value1 = getValueForAddress(op1)
        value2 = getValueForAddress(op2)
        result = (value1 >= value2)
        setValueForAddress dest, result
        line_number++
      when 14
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value1 = getValueForAddress(op1)
        value2 = getValueForAddress(op2)
        result = (value1 is value2)
        setValueForAddress dest, result
        line_number++
      when 15
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value1 = getValueForAddress(op1)
        value2 = getValueForAddress(op2)
        result = (value1 isnt value2)
        setValueForAddress dest, result
        line_number++
      when 16
        op1 = parseInt(line[1])
        dest = parseInt(line[3])
        value = getValueForAddress(op1)
        result = (not value)
        setValueForAddress dest, result
        line_number++
      when 17
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value1 = getValueForAddress(op1)
        value2 = getValueForAddress(op2)
        result = (value1 and value2)
        setValueForAddress dest, result
        line_number++
      when 18
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value1 = getValueForAddress(op1)
        value2 = getValueForAddress(op2)
        result = (value1 or value2)
        setValueForAddress dest, result
        line_number++
      when 19
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value1 = getValueForAddress(op1)
        value2 = getValueForAddress(op2)
        result = (value1 + value2)
        setValueForAddress dest, result
        line_number++
      when 20
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value1 = getValueForAddress(op1)
        value2 = getValueForAddress(op2)
        result = (value1 - value2)
        setValueForAddress dest, result
        line_number++
      when 21
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value1 = getValueForAddress(op1)
        value2 = getValueForAddress(op2)
        result = (value1 * value2)
        setValueForAddress dest, result
        line_number++
      when 22
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value1 = getValueForAddress(op1)
        value2 = getValueForAddress(op2)
        if value2 is 0
          throw new Error("Cero division!")
        else
          result = (value1 / value2)
        setValueForAddress dest, result
        line_number++
      when 23
        unless era is `undefined`
          stack_proc_names.push proc_name
          stack_era.push era
        stack_ref.push "|"
        op1 = line[1]
        stack_proc_names.push proc_name  unless proc_name is `undefined`
        proc_name = op1
        normal = procedures[op1]["memory"]["normal"]
        temporal = procedures[op1]["memory"]["temporal"]
        pointers_dic = procedures[op1]["memory"]["pointers"]
        era = [ new LocalMemory(normal, temporal), new Memory(pointers_dic) ]
        line_number++
      when 24
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        id = procedures[proc_name]["args"][dest]["id"]
        address = procedures[proc_name]["local_vars"][id]["value"]
        if op2 is 0
          value = getValueForAddress(op1)
          era[0].setValue address, value
        else if op2 is 1
          value = getValueForAddress(op1)
          era[0].setValue address, value
          stack_ref.push op1
        else if op2 is 2
          size = procedures[proc_name]["local_vars"][id]["size"]
          i = 0

          while i < size
            value = getValueForAddress(op1)
            era[0].setValue address, value
            stack_ref.push op1
            address++
            op1++
            i++
        line_number++
      when 25
        stack_line.push line_number + 1
        stack_memory.push local_memory
        stack_pointers.push pointers_memory
        local_memory = era[0]
        pointers_memory = era[1]
        era = stack_era.pop()
        dest = parseInt(line[3])
        line_number = dest
      when 26
        args = procedures[proc_name]["args"]
        i = 0

        while i < args.length
          if args[i]["ref"]
            id = args[i]["id"]
            if args[i]["array"]
              size = args[i]["size"]
              address = procedures[proc_name]["local_vars"][id]["value"]
              j = 0

              while j < size
                value = getValueForAddress(address)
                stack_values.push value
                address++
                j++
            else
              address = procedures[proc_name]["local_vars"][id]["value"]
              value = getValueForAddress(address)
              stack_values.push value
          i++
        local_memory = stack_memory.pop()
        pointers_memory = stack_pointers.pop()
        until stack_ref.look() is "|"
          address = stack_ref.pop()
          value = stack_values.pop()
          setValueForAddress address, value
        stack_ref.pop()
        proc_name = stack_proc_names.pop()
        line_number = stack_line.pop()
      when 27
        op1 = parseInt(line[1])
        dest = parseInt(line[3])
        value = getValueForAddress(op1)
        setValueForAddress dest, value
        line_number++
      when 28, 29
    , 30
        dest = parseInt(line[3])
        value = getValueForAddress(dest)
        output += value
        line_number++
      when 31
        op1 = line[1]
        dest = parseInt(line[3])
        if op1 is "int"
          value = parseInt(input_array[input_index])
        else if op1 is "float"
          value = parseFloat(input_array[input_index])
        else if op2 is "boolean"
          value = Boolean(parseInt(input_array[input_index]))
        else
          value = input_array[input_index]
        input_index++
        setValueForAddress dest, value
        line_number++
      when 32
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value = getValueForAddress(op1)
        throw new Error("Out of bounds!")  if value < op2 or value >= dest
        line_number++
      when 33
        op1 = parseInt(line[1])
        op2 = parseInt(line[2])
        dest = parseInt(line[3])
        value = getValueForAddress(op1)
        result = op2 + value
        pointers_memory.setValue dest, result
        line_number++
  output
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
    const_memory.setValue integers[i], value
  for f of floats
    value = parseFloat(f)
    const_memory.setValue floats[f], value
  for b of booleans
    const_memory.setValue booleans[b], b
  for s of strings
    const_memory.setValue strings[s], s
node = (data) ->
  console.log "DATA" + data
  allText = JSON.parse(data)
  const_memory = new Memory(allText.const_memory_map)
  setConstValues allText.const_memory_values
  global_memory = new Memory(allText.global_memory_map)
  global_vars = allText.global_memory_values
  procedures = allText.functions
  quadruples = allText.quadruples
  normal = procedures["main"]["memory"]["normal"]
  temporal = procedures["main"]["memory"]["temporal"]
  pointers_dic = procedures["main"]["memory"]["pointers"]
  local_memory = new LocalMemory(normal, temporal)
  pointers_memory = new Memory(pointers_dic)
  runProgram()
line = ""
procedures = {}
const_memory = {}
global_memory = {}
local_memory = {}
pointers_memory = {}
op = ""
op1 = ""
op2 = ""
dest = ""
proc_name = ""
global_vars = {}
line_number = 0
input_index = 0
quadruples = new Array()
stack_ref = new Stack()
stack_memory = new Stack()
stack_line = new Stack()
stack_era = new Stack()
stack_proc_names = new Stack()
stack_values = new Stack()
stack_pointers = new Stack()
input_array = undefined
input_index = undefined
era = undefined
allText = ""
output = ""
exports.node = node
