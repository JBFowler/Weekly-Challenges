# In the game of chess, a queen can attack pieces which are on the same row, column, or diagonal.

# A chessboard can be represented by an 8 by 8 array.

# So if you're told the white queen is at (2, 3) and the black queen at (5, 6), then you'd know you've got a set-up like so:

# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _
# _ _ _ W _ _ _ _
# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ B _
# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _

# You'd also be able to answer whether the queens can attack each other. In this case, that answer would be yes, they can, because both pieces share a diagonal.
require 'pry'

class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    @white = white
    @black = black
    fail ArgumentError, 'Queens cannot share a place on the board' if white == black
  end

  def to_s
    squares = Array.new(8) { Array.new(8, '_') }
    place_queens_on_square(squares)
    squares.map { |row| row.join(' ') }.join("\n")
  end

  def place_queens_on_square(squares)
    squares[white[0]][white[1]] = 'W'
    squares[black[0]][black[1]] = 'B'
  end
end

