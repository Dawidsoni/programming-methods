require_relative("listNode")

class SortedList
  def initialize()
    @first_node = nil
    @node_count = 0
  end

  def find_lower_bound(val)
    node = @first_node
    if val < node.val
      return nil
    end
    while node.next_node.nil? == false && node.next_node.val < val
      node = node.next_node
    end
    return node
  end

  def add_first_node(val)
    node = ListNode.new(nil, @first_node, val)
    @first_node.prev_node = node
    @first_node = node
  end

  def add_after_node(less_node, val)
    node = ListNode.new(less_node, less_node.next_node, val)
    if less_node.next_node.nil? == false
      less_node.next_node.prev_node = node
    end
    less_node.next_node = node
  end

  def insert(val)
    @node_count += 1
    if @first_node.nil?
      @first_node = ListNode.new(nil, nil, val)
    else
      node = find_lower_bound(val)
      if node.nil?
        add_first_node(val)
      else
        add_after_node(node, val)
      end
    end
  end

  def length()
    return @node_count
  end

  def get(ind)
    node = @first_node
    for i in (0..(ind - 1))
      node = node.next_node
    end
    return node.val
  end

  def to_s()
    node = @first_node
    result = ""
    while node.nil? == false
      result += node.val.to_s()
      result += " "
      node = node.next_node
    end
    result += "\n"
  end
end
