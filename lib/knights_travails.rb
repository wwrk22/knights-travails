require_relative './path_tree'

class Knight
  MOVES = [
    [1, 2], [2,1],
    [2, -1], [1, -2],
    [-1, -2], [-2, -1],
    [-2, 1], [-1, 2]
  ]

  attr_accessor :curr_pos

  def initialize(curr_pos = [0, 0])
    @curr_pos = curr_pos
  end

  def move(end_pos)
    path = PathTree.new(@curr_pos, end_pos, MOVES)
    puts "Moved from " + @curr_pos.to_s + " to " + end_pos.to_s
    print "Path: "
    p path.shortest_path
    @curr_pos = end_pos
  end
end
