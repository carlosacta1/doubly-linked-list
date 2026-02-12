# Doubly Linked List implementation in Ruby

class Node
  attr_accessor :prev, :next, :data

  def initialize(data)
    @data = data
    @prev = nil
    @next = nil
  end
end

class DoublyLinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # Insert tail
  def append(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next = new_node
      new_node.prev = @tail
      @tail = new_node
    end
  end

  # Insert head
  def prepend(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next = @head
      @head.prev = new_node
      @head = new_node
    end
  end

  def remove_by_value(value)
    current = @head
    while current
      if current.data == value
        if current.next
          current.next.prev = current.prev
        else
          @tail = current.prev
        end
      end
    end
  end
end

# Test the Node class
list = DoublyLinkedList.new
list.append(10)
list.append(20)
list.prepend(5)
puts "Node 1 data: #{list.tail.data.inspect}"
puts "Node 2 data: #{list.head.data.inspect}"
puts "Node 3 data: #{list.head.next.data.inspect}"

list.remove_by_value(20)
puts "After removing 20, tail data: #{list.tail.data.inspect}" # Should be 10 since 20 was the tail