# Author: Braulio Chavez A00803220
# Classic simple implementation of a FIFO structure
class Queue

	# Empty constructor
	def initialize
		@queue = []
	end

	# Insert an item at the end of the queue
	def enqueue(item)
		@queue << item
	end

	# Removes and return an item from the
	# front of the queue
	def dequeue
		@queue.shift
	end

	# Retrieves the element at the front of
	# the queue without removing it
	def peek
		@queue.first
	end

	# Return the number of items in queue
	def count
		@queue.length
	end

	# Checks if the stack is empty
	def empty?
		@queue.empty?
	end

	# Removes all the elements of the queue
	def clear
		@stack.clear
	end
end