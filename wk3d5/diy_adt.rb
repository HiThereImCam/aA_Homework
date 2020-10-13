#creating stack class

class Stack

    def initialize
        @store_stack = []
    end

    def push(el)
        @store_stack << el
        self # returning self to prevent the user from 
             # changing the underlying array
    end

    def pop
        @store_stack.pop
    end

    def peek
        return [] if store_queue.length < 1
        @store_stack[store_stack.length - 1]
    end

    private
    attr_reader :store_stack
end

#creating a queue class
class Queue
    attr_accessor :store_queue

    def initialize
        @store_queue = []
    end
    
    def enqueue(el)
        @store_queue << el 
        self
    end

    def dequeue 
        @store_queue.shift
    end

    def show
        @store.dup
    end

    def peek
        return [] if store_queue.length < 1
        p @store_queue[0]
    end
end

#creating a map class
class Map
    def initialize
        @store_map = Array.new
    end
end