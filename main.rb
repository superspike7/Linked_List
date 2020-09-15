class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def new_node(value)
    Node.new(value)
  end

  def append(value)
    empty? ? set_head(value) : set_tail(value)
  end

  def remove_at(index)
    removed_node = at(index)
    prev_node = at(index - 1)
    next_node = at(index + 1)
    prev_node.next_node = next_node
    puts "#{removed_node.value} has left the group"
    removed_node
  end

  def pop
    new_tail = at(size - 2)
    old_tail = new_tail.next_node
    new_tail.next_node = nil
    puts " #{old_tail.value} is now poofed! "
    old_tail
  end

  def insert(value, index)
    node = new_node(value)
    prev_node = at(index - 1)
    next_node = at(index)
    prev_node.next_node = node
    node.next_node = next_node
    node
  end

  def find(value)
    node = @head
    index = 0
    count = size - 1
    count.times do
      break if value == node.value
      index += 1
      node = node.next_node
    end
    value == node.value ? index : nil
  end

  def contains?(value)
    node = @head
    count = size - 1
    count.times do
      break if value == node.value
      node = node.next_node
    end
    value == node.value ? true : false
  end

  def at(index)
    node = @head
    count = 0
    size.times do
      break if index == count
      node = node.next_node
      count += 1
    end
    return node
  end

  def prepend(value)
    node = new_node(value)
    node.next_node = head
    @head = node
  end

  def last_node(node)
    return node if node.tail?
    last_node(node.next_node)
  end

  def size
    return 0 if empty?
    count_node(head, 1)
  end

  def empty?
    head.nil?
  end

  def to_s
    node = @head
    display = "( #{node.value} ) -> "
    until node.tail? do
      display += " ( #{node.next_node.value} ) -> "
      node = node.next_node
    end
    display += "nil"
  end

  def set_head(value)
    @head = new_node(value)
  end

  def set_tail(value)
    last_node(head).next_node = new_node(value)
  end

  def count_node(node, counter)
    return counter if node.tail?
    count_node(node.next_node, counter += 1)
  end

  def tail
    last_node(head)
  end

end

class Node

  attr_accessor :value, :next_node

  def initialize(value=nil)
    @value = value
    @next_node = nil
  end

  def tail?
    @next_node.nil?
  end

end

list_test = LinkedList.new
list_test.append('one')
list_test.append('two')
list_test.append('three')
list_test.append('four')
list_test.prepend('zero')

puts list_test
puts list_test.size
p list_test.contains?('three')
p list_test.at(1)
p list_test.find('nine')
list_test.insert("three_point_five", 4)
puts list_test
list_test.remove_at(4)
puts list_test

