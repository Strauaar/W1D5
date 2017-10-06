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
    old_parent = @parent
    @parent = new_parent
    unless new_parent.nil? || new_parent.access_children.include?(self)
      new_parent.access_children << self
    end
    old_parent.access_children.delete(self)
  end

  def children=(child)
    @children = child
  end

  # def add_child(child)
  #   self.access_children << child
  #   child.parent = self
  # end
  #
  # def remove_child(child)
  #   if !self.access_children.include?(child)
  #     raise "No children here"
  #   end
  #   child.parent = nil
  # end

  def children
    @children.dup
  end

  def value
    @value
  end


  protected

  def access_children
    @children
  end


end

# c= PolyTreeNode.new(3)
# b= PolyTreeNode.new(2)
# a= PolyTreeNode.new(1,[b,c])
