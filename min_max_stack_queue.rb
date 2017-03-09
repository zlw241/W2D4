

class MyQueue
  attr_accessor :store

  def initialize
    @store = []
  end

  def enqueue(el)
    store.unshift(el)
  end

  def dequeue
    store.pop
  end

  def peek
    store.last
  end

  def size
    store.length
  end

  def empty?
    store.empty?
  end
end

class MyStack
  attr_accessor :store
  def initialize
    @store = []
  end

  def push(el)
    store << el
  end

  def pop
    store.pop
  end

  def peek
    store.last
  end

  def peek_first
    store.first
  end

  def size
    store.length
  end

  def empty?
    store.empty?
  end
end

class StackQueue

  def initialize
    @push_stack  = MyStack.new
    @pop_stack = MyStack.new
  end

  def enqueue(el)
    push_stack << el
  end

  def dequeue
    if pop_stack.empty?
      transfer
    end
    pop_stack.pop
  end

  def transfer
    if pop_stack.empty?
      until push_stack.empty?
        pop_stack << push_stack.pop
      end
    end
  end

  def peek
    pop_stack.empty? ? push_stack.peek_first : pop_stack.peek
  end

  def size
    push_stack.length + pop_stack.length
  end

  def empty?
    push_stack.empty? && pop_stack.empty?
  end
end



class MaxStack < MyStack

  def push(el)
    if peek > el
      bigger_items = []
      until peek <= el
        bigger_items << pop
      end
      push(el)
      until bigger_items.empty?
        push(bigger_items.pop)
      end
    else
      push(el)
    end
  end

  def max
    peek
  end 
end
