# Author: Braulio Chavez A00803220
# Classic simple implementation of a LIFO structure
class Stack
	# Empty constructor
	def initialize
		@stack = []
	end

	# Insert an item at the top of the stack
	def push(item)
		@stack.push item
	end

	# Removes and returns an item from the top of the stack
	def pop
		@stack.pop
	end

	# Return the number of items in stack
	def count
		@stack.length
	end

	# Checks if the stack is empty
	def empty?
		@stack.empty?
	end

	# Removes all the elements of the stack
	def clear
		@stack.clear
	end

	# Retrieves the element at the top of the stack
	# without removing it
	def look
		@stack.last
	end

  # Get the stack values in string representation
  def to_str
    str_repr = "[#{@stack.join(',')}]"
  end
end
