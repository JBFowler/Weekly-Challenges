class Board

  attr_reader :board

  def initialize
    @board = {}
    create_board
  end

  def create_board
    squares = (1..6).to_a.product((1..6).to_a)
    squares.each do |square|
      board[square] = Square.new
    end
  end

  def display_board
    # board = <<-BOARD
    # Player's Board
    #     1   2   3   4   5   6
    #   +---+---+---+---+---+---+
    # 1 | #{squares[0][0]} | #{squares[0][1]} | #{squares[0][2]} | #{squares[0][3]} | #{squares[0][4]} | #{squares[0][5]} |
    #   +---+---+---+---+---+---+
    # 2 | #{squares[1][0]} | #{squares[1][1]} | #{squares[1][2]} | #{squares[1][3]} | #{squares[1][4]} | #{squares[1][5]} |
    #   +---+---+---+---+---+---+
    # 3 | #{squares[2][0]} | #{squares[2][1]} | #{squares[2][2]} | #{squares[2][3]} | #{squares[2][4]} | #{squares[2][5]} |
    #   +---+---+---+---+---+---+
    # 4 | #{squares[3][0]} | #{squares[3][1]} | #{squares[3][2]} | #{squares[3][3]} | #{squares[3][4]} | #{squares[3][5]} |
    #   +---+---+---+---+---+---+
    # 5 | #{squares[4][0]} | #{squares[4][1]} | #{squares[4][2]} | #{squares[4][3]} | #{squares[4][4]} | #{squares[4][5]} |
    #   +---+---+---+---+---+---+
    # 6 | #{squares[5][0]} | #{squares[5][1]} | #{squares[5][2]} | #{squares[5][3]} | #{squares[5][4]} | #{squares[5][5]} |
    #   +---+---+---+---+---+---+

    # Destoyer : Alive    Cruiser: Alive    Battleship: Alive

    # Computer's Board
    #     1   2   3   4   5   6
    #   +---+---+---+---+---+---+
    # 1 |   |   |   |   |   |   |
    #   +---+---+---+---+---+---+
    # 2 |   |   |   |   |   |   |
    #   +---+---+---+---+---+---+
    # 3 |   |   |   |   |   |   |
    #   +---+---+---+---+---+---+
    # 4 |   |   |   |   |   |   |
    #   +---+---+---+---+---+---+
    # 5 |   |   |   |   |   |   |
    #   +---+---+---+---+---+---+
    # 6 |   |   |   |   |   |   |
    #   +---+---+---+---+---+---+

    # Destoyer : Alive    Cruiser: Alive    Battleship: Alive
    # BOARD
    header = '     1   2   3   4   5   6'
    splitter = '   +---+---+---+---+---+---+'
    
    puts "Player's Board"
    puts header
    puts splitter
    (1..6).each do |num|
      puts "#{num}  | #{board[[num, 1]]} | #{board[[num, 2]]} | #{board[[num, 3]]} | #{board[[num, 4]]} | #{board[[num, 5]]} | #{board[[num, 6]]} |"
      puts splitter
    end
  end
end

class Square
  INITIAL_MARKER = ' '

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end
end

class Battleship

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def play
    board.display_board
  end
end

Battleship.new.play