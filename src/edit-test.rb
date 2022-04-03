require 'oj'
require_relative './coffee'
require './prompt'
require 'tty-file'

# kamwangi = Coffee.new('kenya', 'kamwangi')
# # # p kamwangi

# kamwangi.recipes << [21.0, 50, 26, 8.5, 20.5]
# kamwangi.recipes << [20, 55, 23, 8, 21.5]
# kamwangi.recipes << [20.5, 53, 29, 9, 22]

# kamwangi.highlight << ["grapefruit", "orange", "raspberry"]
# kamwangi.minimise <<  "quinine, orange rind, burnt butter, pastry"
# kamwangi.tactile << "creamy, effervescent"
# kamwangi.highlight << ["grapefruit, orange, raspberry"]

p Coffee.list

# Select Coffee
# Select attribute

def attribute_selector(coffee, attribute)
  return coffee.(attribute)
end

# Display current value
# Enter new value
# Confirm
# Change