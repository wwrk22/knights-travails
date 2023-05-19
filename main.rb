require_relative './lib/path_tree'


MOVES = [
  [1, 2], [2,1],
  [2, -1], [1, -2],
  [-1, -2], [-2, -1],
  [-2, 1], [-1, 2]
]

tree = PathTree.new([0, 0], [3, 3], MOVES)
tree.print_tree
