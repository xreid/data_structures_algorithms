require_relative 'node'

class BinaryTree
  attr_reader :root

  def initialize(array = nil)
    # shuffle to ensure the array is unordered
    array.shuffle.each { |element| add(element) } unless array.nil?
  end

  def add(data)
    if @root.nil?
      @root = Node.new(data)
    else
      @root.add(data)
    end
  end

  def bfs(target)
    @root.bfs(target)
  end

  def dfs(target)
    @root.dfs(target)
  end

  def dfs_rec(target)
    @root.dfs_rec(target)
  end

  def to_s
    @root.to_s(true)
  end
end

# script
b_tree = BinaryTree.new [11, 12, 43, 2, 7, 33, 0, -11]

puts b_tree
b_tree.add -4
b_tree.add 10
b_tree.add 100
puts b_tree

puts b_tree.bfs(11)
puts b_tree.bfs(0)
puts b_tree.bfs(7)
puts b_tree.bfs(22)

puts b_tree.dfs(11)
puts b_tree.dfs(0)
puts b_tree.dfs(7)
puts b_tree.dfs(22)

puts b_tree.dfs_rec(11)
puts b_tree.dfs_rec(0)
puts b_tree.dfs_rec(12)
puts b_tree.dfs_rec(22)
