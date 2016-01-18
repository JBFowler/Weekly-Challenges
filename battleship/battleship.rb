require 'pry'

class Board

  attr_reader :battlefield

  def initialize
    @battlefield = {}
    create_board
  end

  def create_board
    squares = (1..6).to_a.product((1..6).to_a)
    squares.each do |square|
      battlefield[square] = Square.new
    end
  end

  def draw_battlefield(name, destroyer, cruiser, battleship)
    header = '     1   2   3   4   5   6'
    splitter = '   +---+---+---+---+---+---+'
    ships = "Destroyer : #{destroyer}    Cruiser: #{cruiser}    Battleship: #{battleship}"
    
    puts "#{name}'s Battlefield"
    puts header
    puts splitter
    (1..6).each do |num|
      puts "#{num}  | #{battlefield[[num, 1]]} | #{battlefield[[num, 2]]} | #{battlefield[[num, 3]]} | #{battlefield[[num, 4]]} | #{battlefield[[num, 5]]} | #{battlefield[[num, 6]]} |"
      puts splitter
    end
    puts ''
    puts ships
  end

  def check_square(square)
    battlefield[square] == ' '
  end

  def mark_square(square)
    
  end

  def [](num)
    battlefield[[num[0].to_i, num[3].to_i]].marker
  end

  def []=(num, marker)
    battlefield[[num[0].to_i, num[3].to_i]].marker = marker
  end

  def empty_squares
    battlefield.keys.select { |key| battlefield[key].marker == ' '}
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Fleet
  attr_accessor :destroyer, :cruiser, :battleship

  def initialize
    @destroyer = {status: 'Alive'}
    @cruiser = {status: 'Alive'}
    @battleship = {status: 'Alive'}
    assign_board_spots_to_ships
  end

  def assign_board_spots_to_ships
    destroyer[:position] = [[3, 3]]
    cruiser[:position] = [[1, 5], [1, 6]]
    battleship[:position] = [[5, 1], [5, 2], [5, 3]]
  end
end

class Player
  attr_accessor :name, :board, :fleet

  def initialize
    set_name
    @board = Board.new
    @fleet = Fleet.new
  end

  def draw_board
    board.draw_battlefield(name, fleet.destroyer[:status], fleet.cruiser[:status], fleet.battleship[:status])
  end
end

class Human < Player
  def set_name
    name = ''
    puts "Please enter your name?"
    loop do
      name = gets.chomp
      break unless name.empty?
      puts "Please enter a valid name: "
    end
    self.name = name.capitalize
  end

  def choose_square(computer_board)
    square = ''
    puts "Please choose a square ex.(1, 3): "
    loop do
      square = gets.chomp
      if square[0].to_i == 0 || square[1] != ',' || square[2] != ' ' || square[3].to_i == 0 || square[0].to_i > 6 || square[3].to_i > 6 || computer_board[square] == 'X'
        puts "Square is either taken or outside of the board, please enter a valid square ex.(1, 3): "
      elsif computer_board[square] == ' '
        # if hit? 
          computer_board[square] = 'X'
          break
        # else
        #   opposing_board[square] = '/'
        #   break
        # end
      end
    end
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'John', 'Master Chief', 'C3P0', 'WALL-E', 'Baymax', 'Malfurion', 'Darth Vader'].sample
  end

  def choose_square(human_board)
    available_squares = human_board.empty_squares.sample.join(', ')
    human_board[available_squares] = 'X'
  end
end

class Battleship

  attr_reader :human, :computer, :current_player

  STARTING_PLAYER = 'Human'

  def initialize
    @human = Human.new
    @computer = Computer.new
    @current_player = STARTING_PLAYER
  end

  def display_board
    system 'clear'
    human.draw_board
    puts ''
    computer.draw_board
  end

  def current_player_goes
    if current_player == 'Human'
      human.choose_square(computer.board)
      @current_player = 'Computer'
    else
      computer.choose_square(human.board)
      @current_player = 'Human'
    end 
  end

  def play
    display_board
    loop do
      current_player_goes
      display_board
    end
  end
end

Battleship.new.play