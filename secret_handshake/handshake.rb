# You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10000 = Reverse the order of the operations in the secret handshake.

# handshake = SecretHandshake.new 9
# handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]

# Classes and methods
# SecretHandshake
# - initialize(number)
# - commands
# - possible 'case' or methods for handshake style using if functions
# - Need methods to calculate binary code value
# - Create Constant that holds array to represent handshakes

# Top level class
class SecretHandshake
  GESTURES = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(number)
    convert_to_array(number)
  end

  def commands
    binary_num = @binary_num
    return [] if binary_num == 0
    handshakes = []
    binary_num.reverse!
    binary_num[0..3].each_with_index do |value, idx|
      handshakes << GESTURES[idx] if value == '1'
    end
    handshakes.reverse! if binary_num.size > 4
    handshakes
  end

  private

  def convert_to_array(number)
    if number.instance_of?(Fixnum)
      @binary_num = number.to_s(2).split(//)
    elsif /[^01]/.match(number)
      @binary_num = 0
    else
      @binary_num = number.split(//)
    end
  end
end

# handshake = SecretHandshake.new 9
# p handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]
