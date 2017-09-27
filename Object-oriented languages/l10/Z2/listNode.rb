class ListNode
  attr_accessor(:prev_node, :next_node, :val)

  def initialize(prev_node, next_node, val)
    @prev_node = prev_node
    @next_node = next_node
    @val = val
  end
end
