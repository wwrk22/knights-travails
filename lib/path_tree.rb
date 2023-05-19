require_relative './square'

class PathTree
  attr_accessor :start_square, :end_square, :possible_moves

  def initialize(start_square, end_square, possible_moves)
    @start_square = Square.new(start_square)
    @end_square = Square.new(end_square)
    @possible_moves = possible_moves
    build_tree
  end

  def build_tree
    square_queue = [@start_square]

    until square_queue.empty? do
      curr_square = square_queue.shift
      dest_squares = compute_dest_squares(curr_square)

      if dest_squares.one? { |square| square == @end_square }
        link_end_square(curr_square)
        break
      end

      dest_squares.each do |square|
        link_enqueue_square(square, curr_square, square_queue)
      end
    end
  end

  def shortest_path
    path = []
    curr_square = @end_square

    until curr_square.nil? do
      path << curr_square.pos
      curr_square = curr_square.parent
    end

    path.reverse
  end

  def print_tree
    square_queue = [@start_square]
    
    until square_queue.empty? do
      curr_square = square_queue.shift
      p curr_square.pos
      puts
      curr_square.children.each { |child| square_queue << child }
    end
  end

  private
  
  def link_end_square(parent)
    parent.children << @end_square
    @end_square.parent = parent
  end

  def link_enqueue_square(square, parent, square_queue)
    square.parent = parent
    parent.children << square
    square_queue << square
  end

  def compute_dest_squares(start_square)
    dest_squares = []

    @possible_moves.each do |move|
      add_valid_square(start_square, move, dest_squares)
    end

    dest_squares
  end

  def add_valid_square(start_square, move, dest_squares)
    dest_pos = [start_square[0] + move[0], start_square[1] + move[1]]
    dest_square = Square.new(dest_pos)
    dest_squares << dest_square if dest_square.valid?
  end
end
