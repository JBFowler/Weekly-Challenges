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