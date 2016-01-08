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

# Top level Class
class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    @white = white
    @black = black
    fail ArgumentError, 'Queens cannot share place on board' if white == black
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

  def attack?
    same_row? || same_column? || diagonal?
  end

  def same_row?
    white[0] == black[0]
  end

  def same_column?
    white[1] == black[1]
  end

  def diagonal?
    (white[0] - black[0]).abs == (white[1] - black[1]).abs
    # (white[0] == white[1] && black[0] == black[1]) ||
    #   ((white[0] - black[0]) == (black[1] - white[1])) ||
    #   ((black[0] - white[0]) == (white[1] - black[1])) ||
    #   ((black[0] - white[0]) == (black[1] - white[1])) ||
    #   ((white[0] - black[0]) == (white[1] - black[1]))
  end
end
