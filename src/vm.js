// Creates a memory data structure for storing variables
// Params:
// Dictionary describing the map of the memory
// memory = {int_init_addr, float_init_addr, boolean_init_addr, string_init_addr, 
// int_count, float_count, boolean_count, string_count}
function Memory(memory)
{
    this.integers = new Array(Math.floor(memory["int_count"]));
    this.int_count = Math.floor(memory["int_count"]);
    this.int_init_addr = Math.floor(memory["int_init_addr"]);
    this.floats = new Array(Math.floor(memory["float_count"]));
    this.float_count = Math.floor(memory["float_count"]);
    this.float_init_addr = Math.floor(memory["float_init_addr"]);
    this.booleans = new Array(Math.floor(memory["boolean_count"]));
    this.boolean_count = Math.floor(memory["boolean_count"]);
    this.boolean_init_addr = Math.floor(memory["boolean_init_addr"]);
    this.strings = new Array(Math.floor(memory["string_count"]));
    this.string_count = Math.floor(memory["string_count"]);
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

var line,
