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

class SecretHandshake
  GESTURES = ['wink', 'double blink', 'close your eyes', 'jump']
  REVERSE_GESTURES = ['jump', 'close your eyes', 'double blink', 'wink']
  # attr_accessor :initial_value

  def initialize(number)
    setup(number)
    @handshakes = []
    decrypt_code
  end

  def commands
    @handshakes
  end

  private

  def setup(number)
    if number.instance_of?(Fixnum)
      @binary_num = number.to_s(2).split(//) #converstion to binary must take place during initialization
    else
      @binary_num = number.split(//)
    end
  end

  def reverse_number!
    @binary_num.reverse!
  end

  def remove_first_value!
    @binary_num.shift
  end

  def decrypt_code
    if @binary_num.size < 5
      reverse_number!
      @binary_num.each_with_index do |value, idx|
        @handshakes << GESTURES[idx] if value == '1'
      end
    else
      remove_first_value!
      @binary_num.each_with_index do |value, idx|
        @handshakes << REVERSE_GESTURES[idx] if value == '1'
      end
    end
  end
end

# handshake = SecretHandshake.new 9
# p handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]