require 'oj'
require './coffee'

# kamwangi = Coffee.new('kenya', 'kamwangi')
x = []

p x
puts "Initial list follows"
p Coffee.list

x << Oj.load_file('./coffees.json')
puts "After parsing"
p Coffee.list
puts "and x is"
p x

kamwangi = Coffee.new('kenya', 'kamwangi')
gacatha = Coffee.new('kenya', 'gachatha')
decaf = Coffee.new('colombia', 'la serrania')
puts "Updated list now"
x = Coffee.list

puts "New x"
p x

Oj.to_file('./coffees.json', x)