class Square
  X = 0
  Y = 1

  attr_accessor :pos, :parent, :children

  def initialize(pos, parent: nil, children: [])
    @pos = pos
    @parent = parent
    @children = children
  end

  def [](index)
    @pos[index]
  end

  def ==(other_square)
    self[0] == other_square[0] && self[1] == other_square[1]
  end

  def valid?
    (0 <= @pos[X] && @pos[X] < 8) && (0 <= @pos[Y] && @pos[Y] < 8)
  end
end
