# ## Step 1

# The robot factory manufactures robots that have three possible
# movements:

# - turn right
# - turn left
# - advance

# Robots are placed on a hypothetical infinite grid, facing a particular
# direction (north, east, south, or west) at a set of {x,y} coordinates,
# e.g., {3,8}.

# ## Step 2

# Robots can pivot left and right.

# The robot factory manufactures robots that have three possible
# movements:

# - turn right
# - turn left
# - advance

# The factory's test facility needs a program to verify robot movements.

# There are a number of different rooms of varying sizes, measured in
# Robot Units, the distance a robot moves when you instruct it to
# `advance`.

# The floor of the room is a grid, each square of which measures 1 square
# RU (Robot Unit).

# The rooms are always oriented so that each wall faces east, south, west,
# and north.

# The test algorithm is to place a robot at a coordinate in the room,
# facing in a particular direction.

# The robot then receives a number of instructions, at which point the
# testing facility verifies the robot's new position, and in which
# direction it is pointing.

# ## Step 3

# The robot factory manufactures robots that have three possible
# movements:

# - turn right
# - turn left
# - advance

# The robot factory's test facility has a simulator which can take a
# string of letters and feed this into a robot as instructions.

# - The letter-string "RAALAL" means:
#   - Turn right
#   - Advance twice
#   - Turn left
#   - Advance once
#   - Turn left yet again
# - Say a robot starts at {7, 3} facing north. Then running this stream
#   of instructions should leave it at {9, 4} facing west.

require 'pry'

# Top Level Class
class Robot
  DIRECTIONS = [:west, :north, :east, :south]

  attr_accessor :bearing, :x_coord, :y_coord

  def orient(direction)
    raise ArgumentError, 'Invalid Direction' unless DIRECTIONS.include?(direction)
    self.bearing = direction
  end

  def turn_right
    turn(1, 2, 3, 0)
  end

  def turn_left
    turn(3, 0, 1, 2)
  end

  def turn(w, n, e, s)
    self.bearing = case bearing
                   when :west then DIRECTIONS[w]
                   when :north then DIRECTIONS[n]
                   when :east then DIRECTIONS[e]
                   when :south then DIRECTIONS[s]
                   end
  end

  def at(x, y)
    self.x_coord = x
    self.y_coord = y
  end

  def coordinates
    [x_coord, y_coord]
  end

  def advance
    case bearing
    when :west
      self.x_coord -= 1
    when :east
      self.x_coord += 1
    when :north
      self.y_coord += 1
    when :south
      self.y_coord -= 1
    end
  end
end

# Top Level Class
class Simulator
  INSTRUCTIONS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }

  def instructions(string)
    string.upcase.each_char.map do |char|
      INSTRUCTIONS[char]
    end
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, instructions)
    instructions(instructions).each do |command|
      robot.send(command)
    end
  end
end
