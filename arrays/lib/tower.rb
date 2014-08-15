class Tower
  attr_accessor :stacks
  
  def initialize(stacks = false)
    @stacks = (stacks ? stacks : [[1, 2, 3, 4], [], []])
  end
  
  def move(pos)
    from, to = pos
    from, to = from - 1, to - 1
    stacks[to].unshift(stacks[from].shift)
  end
  
  def valid_move?(pos)
    from, to = pos[0] - 1, pos[1] - 1
    return false if stacks[from].empty?
    array = stacks[to].dup
    top_item = stacks[from][0]
    array.unshift(top_item)
    array == array.sort
  end
  
  def won?
    return false unless stacks.count { |stack| !stack.empty? } == 1
    return false unless stacks[0].empty?
    stacks.flatten.compact == stacks.flatten.compact.sort
  end
end