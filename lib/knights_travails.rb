require_relative './square'

class Knight
  MOVES = [
    [1, 2], [2,1],
    [2, -1], [1, -2],
    [-1, -2], [-2, -1],
    [-2, 1], [-1, 2]
  ]

  attr_accessor :pos

  def initialize(pos = [0, 0])
    @pos = pos
  end
end
