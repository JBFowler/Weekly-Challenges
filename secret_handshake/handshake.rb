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
  attr_accessor :initial_value

  def initialize(number)
    setup(number)
    @handshakes = []
    decrypt_code
  end

  def setup(number)
    if number.instance_of?(Fixnum)
      @initial_value = number.to_s(2).split(//) #converstion to binary must take place during initialization
    else
      @initial_value = number.split(//)
    end
  end

  def commands
    @handshakes
  end

  def wink
    "wink"
  end

  def double_blink
    "double blink"
  end

  def close_your_eyes
    "close your eyes"
  end

  def jump
    "jump"
  end

  def decrypt_code
    if @initial_value.size < 5
      @initial_value.reverse!
      if @initial_value[0] == '1'
        @handshakes << wink
      end
      if !@initial_value[1].nil? && @initial_value[1] == '1'
        @handshakes << double_blink
      end
      if !@initial_value[2].nil? && @initial_value[2] == '1'
        @handshakes << close_your_eyes
      end
      if !@initial_value[3].nil? && @initial_value[3] == '1'
        @handshakes << jump
      end
    else
      @initial_value.shift
      if @initial_value[0] == '1'
        @handshakes << jump
      end
      if @initial_value[1] == '1'
        @handshakes << close_your_eyes
      end
      if @initial_value[2] == '1'
        @handshakes << double_blink
      end
      if @initial_value[3] == '1'
        @handshakes << wink
      end
    end
  end
end

# handshake = SecretHandshake.new 9
# p handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]