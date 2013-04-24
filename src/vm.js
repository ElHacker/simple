var line_number, line, procedures, quadruples, const_memory, global_memory, local_memory, op, op1, op2, dest, proc_name, stack_proc_names, stack_ref, stack_memory, stack_values, era, stack_era, stack_line, global_vars, input_array, input_index;
var request;
var allText;

// Creates a memory data structure for storing variables
// Params:
// Dictionary describing the map of the memory
// memory = {int_init_addr, float_init_addr, boolean_init_addr, string_init_addr,
// int_count, float_count, boolean_count, string_count}
function Memory(memory) {
    this.int_count = Math.floor(memory["int_count"]);
    this.integers = new Array(this.int_count);
    this.int_init_addr = Math.floor(memory["int_init_addr"]);
    this.float_count = Math.floor(memory["float_count"]);
    this.floats = new Array(this.float_count);
    this.float_init_addr = Math.floor(memory["float_init_addr"]);
    this.boolean_count = Math.floor(memory["boolean_count"]);
    this.booleans = new Array(this.boolean_count);
    this.boolean_init_addr = Math.floor(memory["boolean_init_addr"]);
    this.string_count = Math.floor(memory["string_count"]);
    this.strings = new Array(this.string_count);
    this.string_init_addr = Math.floor(memory["string_init_addr"]);

    // Searches if an address belongs to this memory
    /*
    this.searchAddress = function(address) {
        if ((address >= this.int_init_addr && address <= (this.int_init_addr + this.int_count)) ||
            (address >= this.float_init_addr && address <= (this.float_init_addr + this.float_count)) ||
            (address >= this.boolean_init_addr && address <= (this.boolean_init_addr + this.boolean_count)) ||
            (address >= this.string_init_addr && address <= (this.string_init_addr + this.string_count)))
        {
            return true;
        }
        return false;
    }
    */
    this.searchAddress = function(address) {
        address = Math.floor(address);
        if (address >= this.int_init_addr && address <= (this.string_init_addr + this.string_count)) {
            return true;
        }
        return false;
    };

    // Returns the corresponding value for an address
    this.getValue = function(address) {
        address = Math.floor(address);
        if (address >= this.int_init_addr && address <= (this.int_init_addr + this.int_count)) {
            return this.integers[address - this.int_init_addr];
        } else if (address >= this.float_init_addr && address <= (this.float_init_addr + this.float_count)) {
            return this.floats[address - this.float_init_addr];
        } else if (address >= this.boolean_init_addr && address <= (this.boolean_init_addr + this.boolean_count)) {
            return this.booleans[address - this.boolean_init_addr];
        } else {
            return this.strings[address - this.string_init_addr];
        }
    };

    // Sets the corresponding value for an address
    this.setValue = function(address, value) {
        address = Math.floor(address);
        if (address >= this.int_init_addr && address <= (this.int_init_addr + this.int_count)) {
            this.integers[address - this.int_init_addr] = value;
        } else if (address >= this.float_init_addr && address <= (this.float_init_addr + this.float_count)) {
            this.floats[address - this.float_init_addr] = value;
        } else if (address >= this.boolean_init_addr && address <= (this.boolean_init_addr + this.boolean_count)) {
            this.booleans[address - this.boolean_init_addr] = value;
        } else {
            this.strings[address - this.string_init_addr] = value;
        }
    };

    // Returns the initial address of all the block
    this.initial_address = function() {
        return this.int_init_addr;
    };
}

// Creates a memory data structure for storing variables
// Params:
// Dictionaries describing the map of the memory
// normal = {int_init_addr, float_init_addr, boolean_init_addr, string_init_addr,
// int_count, float_count, boolean_count, string_count}
// temporal = {int_init_addr, float_init_addr, boolean_init_addr, string_init_addr,
// int_count, float_count, boolean_count, string_count}
function LocalMemory(normal, temporal) {
    this.normal = new Memory(normal);
    this.temporal = new Memory(normal);

    // Returns the corresponding value for an address
    this.getValue = function(address) {
        address = Math.floor(address);
        if (address < this.temporal.initial_address()) {
            return this.normal.getValue(address);
        } else {
            return this.temporal.getValue(address);
        }
    };

    // Sets the corresponding value for an address
    this.setValue = function(address, value) {
        address = Math.floor(address);
        if (address < this.temporal.initial_address()) {
            this.normal.setValue(address, value);
        } else {
            this.temporal.setValue(address, value);
        }
    };
}

// Access the memory according with the address of the variable
function getValueForAddress(address) {
    if (address < local_memory.normal.initial_address()) {
        return global_memory.getValue(address);
    } else if (address < const_memory.initial_address()) {
        return local_memory.getValue(address);
    } else {
        return const_memory.getValue(address);
    }
}

// Set the value for a memory address
function setValueForAddress(address, value) {
    if (address < local_memory.normal.initial_address()) {
        global_memory.setValue(address, value);
    } else {
        local_memory.setValue(address, value);
    }
}

// Creates an stack
function Stack() {
    this.stack = new Array();

    this.push = function(value) {
        this.stack.push(value);
    };

    this.pop = function() {
        return this.stack.pop();
    };

    this.look = function() {
        if (this.stack.length > 0) {
            return this.stack[this.stack.length - 1];
        }
        return undefined;
    };
}

line_number = 0;
input_index = 0;
quadruples = new Array();
stack_ref = new Stack();
stack_memory = new Stack();
stack_line = new Stack();
stack_era = new Stack();
stack_proc_names = new Stack();
stack_values = new Stack();
era = undefined;

function runProgram() {
    while (line_number < quadruples.length) {
        line = quadruples[line_number].split(' ');
        op = parseInt(line[0]);

        // ------------------------------------------------------------
        // IMPORTANT!
        // The line_number pointer is incremented in every operation
        // Except in the GOTO, GOTOV, GOTOF and GOSUB
        // ------------------------------------------------------------

        switch (op) {
            case 0:
                // INT
                break;
            case 1:
                // FLOAT
                break;
            case 2:
                // BOOLEAN
                break;
            case 3:
                // STRING
                break;
            case 4:
                // ARRAY
                break;
            case 5:
                // VOID
                break;
            case 6:
                // GOTO
                dest = parseInt(line[3]);
                line_number = dest;
                break;
            case 7:
                // GOTOF
                op1 = parseInt(line[1]);
                dest = parseInt(line[3]);
                value = getValueForAddress(op1);
                if (!value) {
                    line_number = dest;
                } else {
                    line_number++;
                }
                break;
            case 8:
                // GOTOV
                op1 = parseInt(line[1]);
                dest = parseInt(line[3]);
                value = getValueForAddress(op1);
                if (value) {
                    line_number = dest;
                } else {
                    line_number++;
                }
                break;
            case 9:
                // ASSIGN
                op1 = parseInt(line[1]);
                dest = parseInt(line[3]);
                value = getValueForAddress(op1);
                setValueForAddress(dest, value);
                line_number++;
                break;
            case 10:
                // LT
                op1 = parseInt(line[1]);
                op2 = parseInt(line[2]);
                dest = parseInt(line[3]);
                value1 = getValueForAddress(op1);
                value2 = getValueForAddress(op2);
                result = (value1 < value2);
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 11:
                // LE
                op1 = parseInt(line[1]);
                op2 = parseInt(line[2]);
                dest = parseInt(line[3]);
                value1 = getValueForAddress(op1);
                value2 = getValueForAddress(op2);
                result = (value1 <= value2);
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 12:
                // GT
                op1 = parseInt(line[1]);
                op2 = parseInt(line[2]);
                dest = parseInt(line[3]);
                value1 = getValueForAddress(op1);
                value2 = getValueForAddress(op2);
                result = (value1 > value2);
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 13:
                // GE
                op1 = parseInt(line[1]);
                op2 = parseInt(line[2]);
                dest = parseInt(line[3]);
                value1 = getValueForAddress(op1);
                value2 = getValueForAddress(op2);
                result = (value1 >= value2);
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 14:
                // EQ
                op1 = parseInt(line[1]);
                op2 = parseInt(line[2]);
                dest = parseInt(line[3]);
                value1 = getValueForAddress(op1);
                value2 = getValueForAddress(op2);
                result = (value1 == value2);
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 15:
                // NE
                op1 = parseInt(line[1]);
                op2 = parseInt(line[2]);
                dest = parseInt(line[3]);
                value1 = getValueForAddress(op1);
                value2 = getValueForAddress(op2);
                result = (value1 != value2);
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 16:
                // NOT
                op1 = parseInt(line[1]);
                dest = parseInt(line[3]);
                value = getValueForAddress(op1);
                result = (! value);
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 17:
                // AND
                op1 = parseInt(line[1]);
                op2 = parseInt(line[2]);
                dest = parseInt(line[3]);
                value1 = getValueForAddress(op1);
                value2 = getValueForAddress(op2);
                result = (value1 && value2);
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 18:
                // OR
                op1 = parseInt(line[1]);
                op2 = parseInt(line[2]);
                dest = parseInt(line[3]);
                value1 = getValueForAddress(op1);
                value2 = getValueForAddress(op2);
                result = (value1 || value2);
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 19:
                // PLUS
                op1 = parseInt(line[1]);
                op2 = parseInt(line[2]);
                dest = parseInt(line[3]);
                value1 = getValueForAddress(op1);
                value2 = getValueForAddress(op2);
                result = (value1 + value2);
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 20:
                // MINUS
                op1 = parseInt(line[1]);
                op2 = parseInt(line[2]);
                dest = parseInt(line[3]);
                value1 = getValueForAddress(op1);
                value2 = getValueForAddress(op2);
                result = (value1 - value2);
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 21:
                // TIMES
                op1 = parseInt(line[1]);
                op2 = parseInt(line[2]);
                dest = parseInt(line[3]);
                value1 = getValueForAddress(op1);
                value2 = getValueForAddress(op2);
                result = (value1 * value2);
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 22:
                // DIVIDE
                op1 = parseInt(line[1]);
                op2 = parseInt(line[2]);
                dest = parseInt(line[3]);
                value1 = getValueForAddress(op1);
                value2 = getValueForAddress(op2);
                if (value2 == 0) {
                    throw new Error("Cero division!");
                } else {
                    result = (value1 / value2);
                }
                setValueForAddress(dest, result);
                line_number++;
                break;
            case 23:
                // ERA

                // First, check if there is another reserved memory for procedure
                if (era != undefined) {
                    // In this case, save the actual reserved memory and the procedure name
                    stack_proc_names.push(proc_name);
                    stack_era.push(era);
                }
                // Put a false bottom to the reference stack
                stack_ref.push("|");
                // Reserve the necessary memory for the new procedure call
                op1 = line[1];
            if (proc_name != undefined) {
                stack_proc_names.push(proc_name);
            }
                proc_name = op1;
                normal = procedures[op1]["memory"]["normal"];
                temporal = procedures[op1]["memory"]["normal"];
                era = new LocalMemory(normal, temporal);

                line_number++;
                break;
            case 24:
                // PARAM
                op1 = parseInt(line[1]);  // Address
                op2 = parseInt(line[2]);  // Is reference?
                dest = parseInt(line[3]);  // Number of param
                value = getValueForAddress(op1);

                // Save the value in the new reserved memory according with the number of the parameter
                id = procedures[proc_name]["args"][dest]["id"];
                address = procedures[proc_name]["local_vars"][id]["value"];
                era.setValue(address, value);

                // If it is a reference, then save the address in the reference stack to copy data later
                if (op2) {
                    stack_ref.push(op1);
                }

                line_number++;
                break;
            case 25:
                // GOSUB
                // Save the next line number for later return
                stack_line.push(line_number + 1);
                // Save the actual local memory
                stack_memory.push(local_memory);
                // Change the local memory with the Era pointer
                local_memory = era;
                // Set era with the pending reserved memory in the stack_era
                // so the magic in ERA to works ;)
                era = stack_era.pop();
                dest = parseInt(line[3]);  // Line number
                line_number = dest;
                break;
            case 26:
                // GOEND

                // Save the values of the actual variables that are references in the stack_values
                args = procedures[proc_name]["args"];
                for (var i = 0; i < args.length; i++) {
                    if (args[i]["ref"]) {
                        id = args[i]["id"];
                        address = procedures[proc_name]["local_vars"][id]["value"];
                        value = getValueForAddress(address);
                        stack_values.push(value);
                    }
                }

                // Change the local_memory for the one in the stack_memory
                local_memory = stack_memory.pop();
                // Now, with the values and directions in the stacks, transfer the information
                // until the 'false' bottom is founded
                while (stack_ref.look() != '|') {
                    address = stack_ref.pop();
                    value = stack_values.pop();
                    setValueForAddress(address, value);
                }
                // Extracts the 'false' bottom
                stack_ref.pop();
// TODO
                // Change the procedure name
                proc_name = stack_proc_names.pop();
                // Change the line number
                line_number = stack_line.pop();
                break;
            case 27:
                // RET
                op1 = parseInt(line[1]);
                dest = parseInt(line[3]);
                value = getValueForAddress(op1);
                setValueForAddress(dest, value);
                line_number++;
                break;
            case 28:
                // LPARENT
                break;
            case 29:
                // RPARENT
                break;
            case 30:
                // PRINT
                dest = parseInt(line[3]);
                value = getValueForAddress(dest);
                // TODO Change this with the corresponding area to print
                console.log(value);
                /*
                text = document.getElementById("salida").innerHTML;
                text += value;
                document.getElementById("salida").innerHTML = text;
                */

                line_number++;
                break;
            case 31:
                // INPUT
                op1 = line[1];
                dest = parseInt(line[3]);
                if (op1 == 'int') {
                    value = parseInt(input_array[input_index]);
                } else if (op1 == 'float') {
                    value = parseFloat(input_array[input_index]);
                } else if (op2 == 'boolean') {
                    value = Boolean(parseInt(input_array[input_index]));
                } else {
                    value = input_array[input_index];
                }
                input_index++;
                setValueForAddress(dest, value);
                line_number++;
                break;
        }
    }
}

function setConstValues(dictionary) {
    var integers, floats, booleans, strings;
    integers = dictionary["int"];
    floats = dictionary["float"];
    booleans = dictionary["boolean"];
    strings = dictionary["string"];

    //------------------------------------------------------------
    // Itereates every key-value and map it in the const_memory
    //------------------------------------------------------------

    // Integers
    for (var i in integers) {
        value = parseInt(i);
        const_memory.setValue(integers[i], value);
    }

    // Floats
    for (var f in floats) {
        value = parseFloat(f);
        const_memory.setValue(floats[f], value);
    }

    // Booleans
    for (var b in booleans) {
        const_memory.setValue(booleans[b], b);
    }

    // Strings
    for (var s in strings) {
        const_memory.setValue(strings[s], s);
    }
}

function getRequestObject() {
    if (window.ActiveXObject) {
        return (new ActiveXObject("Microsoft.XMLHTTP"));
    } else if (window.XMLHttpRequest) {
        return (new XMLHttpRequest());
    } else {
        alert("Navigator no supported!");
        return null;
    }
}

function handleResponse() {
    // Makes sure the document is ready to parse and that it's founded
    if (request.readyState == 4 && request.status == 200) {
        // Program code
        allText = JSON.parse(request.responseText);
        //quadruples = allText.split("\n");  // Will separate each line into an array
        // TODO Delete this after the debug proccess
        // Show the program, only for test
        document.getElementById("programa").innerHTML = allText;

        // Input text
        // TODO Change this with the corresponding id for the input's text area
        /*
        allText = document.getElementById("").innerHTML;
        input_array = allText.match(/[^\s]+/g);  // Will separate each line by a space or new line

        // Constant memory
        const_memory = new Memory(JSON.parse(quadruples[0]));
        quadruples.shift();
        // Values
        dictionary = JSON.parse(quadruples[0]);
        quadruples.shift();
        setConstValues(dictionary);
        // Global memory
        global_memory = new Memory(JSON.parse(quadruples[0]));
        quadruples.shift();
        // Values
        global_vars = JSON.parse(quadruples[0]);
        // Procedures
        procedures = JSON.parse(quadruples[0]);
        quadruples.shift();

        // Load the main procedure in the local_memory
        normal = procedures["main"]["memory"]["normal"];
        temporal = procedures["main"]["memory"]["temporal"];
        local_memory = new LocalMemory(normal, temporal);

        // Everything is ready, run the program!!!
        runProgram();
        */
    }
}

function sendRequest() {
    request = getRequestObject();
    request.onreadystatechange = handleResponse;
    request.open("GET", "output.txt", true);
    request.send(null);
}

function node() {
    // Program code
    var fs = require('fs');
    var path = require('path');
    var util = require('util');

    var filePath = path.join(__dirname, 'output.txt');
    fs.readFile('output.txt', function(error, data) {
        if (error) {
            throw new Error(error);
        }
        allText = JSON.parse(data);
        //document.getElementById("programa").innerHTML = allText;

        // Constant memory
        const_memory = new Memory(allText.const_memory_map);
        // Values
        setConstValues(allText.const_memory_values);
        // Global memory
        global_memory = new Memory(allText.global_memory_map);
        // Values
        global_vars = allText.global_memory_values;
        // Procedures
        procedures = allText.functions;
        // Quadruples
        quadruples = allText.quadruples;

        // Load the main procedure in the local_memory
        normal = procedures["main"]["memory"]["normal"];
        temporal = procedures["main"]["memory"]["temporal"];
        local_memory = new LocalMemory(normal, temporal);

        // Everything is ready, run the program!!!
        runProgram();
    });
}

node();
