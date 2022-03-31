require 'oj'
require './coffee'

# kamwangi = Coffee.new('kenya', 'kamwangi', 'high', 'min', 'tact',)
# p kamwangi

# kamwangi.recipes << [21, 56, 23, 9, 22.5]
# p kamwangi

x = Oj.load_file('./coffees.json')

x.each do |coffee|
    coffee = Coffee.new(coffee.origin, coffee.name, coffee.highlight.flatten, coffee.minimise.flatten, coffee.tactile.flatten, coffee.recipes)
end

Coffee.list.each do |coffee|
    coffee.highlight.flatten!
    coffee.minimise.flatten!
    coffee.tactile.flatten!
    coffee.recipes.flatten!
end

p Coffee.list

# Coffee.list << x
# puts "New coffee list"
# p Coffee.list

# puts
# p Coffee

# kamwangi = Coffee.new('kenya', 'kamwangi')
# gacatha = Coffee.new('kenya', 'gachatha')
# decaf = Coffee.new('colombia', 'la serrania')
# puts "Updated list now"
# p (Coffee.list[1]).name
# p (x[1]).name

# puts "New x"
# p Coffee.list

# Oj.to_file('./coffees.json', x)