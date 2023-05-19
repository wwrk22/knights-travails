class Square
  include Comparable

  attr_accessor :pos, :parent, :children

  def initialize(pos, parent: nil, children: [])
    @pos = pos
    @parent = parent
    @children = children
  end

  def [](index)
    @pos[index]
  end

  def <=>(other_square)
    self[0] <=> other_square[0] && self[1] <=> other_square[1]
  end
end
