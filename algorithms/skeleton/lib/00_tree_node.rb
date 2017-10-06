class PolyTreeNode

  def initialize(value, children = [])
    @value = value
    @children = children
    @parent = nil
  end

  def parent
    @parent
  end

  def parent=(new_parent)
    @parent.access_children.delete(self) unless @parent.nil?
    @parent = new_parent
    unless new_parent.nil? || new_parent.access_children.include?(self)
      new_parent.access_children << self
    end
  end

  def children=(child)
    @children = child
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    if !self.access_children.include?(child)
      raise "No children here"
    end
    child.parent = nil
  end

  def children
    @children.dup
  end

  def value
    @value
  end

  def dfs(target)
    return self if self.value == target
    children.each do |child|
      result = child.dfs(target)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target
      queue.concat(current_node.children)
    end
    nil
  end


  protected

  def access_children
    @children
  end


end

# c= PolyTreeNode.new(3)
# b= PolyTreeNode.new(2)
# a= PolyTreeNode.new(1,[b,c])
