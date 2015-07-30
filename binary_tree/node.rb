class Node
  attr_accessor :left, :right, :top, :data

  def initialize(data, top = nil)
    @data = data
    @top  = top
  end

  def add(data)
    if data <= @data
      @left.nil?  ? @left  = Node.new(data, self) : @left.add(data)
    else
      @right.nil? ? @right = Node.new(data, self) : @right.add(data)
    end
  end

  def bfs(target)
    search(target, :bfs)
  end

  def dfs(target)
    search(target, :dfs)
  end

  def dfs_rec(target)
    return self if @data == target
    if target <= @data
      return @left.dfs_rec(target)  unless @left.nil?
    else
      return @right.dfs_rec(target) unless @right.nil?
    end
    -1
  end

  def to_s(all_nodes = false)
    # print entire tree if all_nodes == true
    if all_nodes
      all_data = ''
      all_data << "#{@left.to_s(true)}"  unless @left.nil?
      all_data << "#{@data} "
      all_data << "#{@right.to_s(true)}" unless @right.nil?
      all_data
    else
      "Data:#{@data} Left:#{@left.data unless @left.nil?} Right:"\
      "#{@right.data unless @right.nil?} Top:#{@top.data unless @top.nil?}"
    end
  end

  private

  def search(target, method)
    nodes = [self]
    until nodes.empty?
      # Treat nodes array as a queue for breadth first search
      # Treat nodes array as a stack for depth first search
      current_node = method == :bfs ? nodes.shift : nodes.pop
      return current_node if current_node.data == target
      nodes << current_node.left  unless current_node.left.nil?
      nodes << current_node.right unless current_node.right.nil?
    end
    -1
  end
end
