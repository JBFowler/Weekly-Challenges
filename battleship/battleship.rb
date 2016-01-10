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

  def draw_battlefield(name)
    header = '     1   2   3   4   5   6'
    splitter = '   +---+---+---+---+---+---+'
    ships = 'Destroyer : Alive    Cruiser: Alive    Battleship: Alive'
    
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

class Player
  attr_accessor :name, :board

  def initialize
    set_name
    @board = Board.new
  end

  def draw_board
    board.draw_battlefield(name)
  end
end

class Human < Player
  def set_name
    name = ''
    loop do
      puts "Please enter your name?"
      name = gets.chomp
      break unless name.empty?
    end
    self.name = name
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'John', 'Master Chief', 'C3P0', 'WALL-E', 'Baymax', 'Malfurion', 'Darth Vader'].sample
  end
end

class Battleship

  attr_reader :player, :computer

  def initialize
    @player = Human.new
    @computer = Computer.new
  end

  def display_board
    player.draw_board
    puts ''
    computer.draw_board
  end

  def play
    display_board
  end
end

Battleship.new.play