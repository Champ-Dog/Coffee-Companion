require './coffee'
require 'json'

# puts 'origin?'
# origin = gets.strip 

# puts 'name?'
# name = gets.strip

# p origin
# p name

kamwangi = Coffee.new('kenya', 'kamwangi')
gachatha = Coffee.new('kenya', 'gachatha')

# x = Coffee.to_json
# p x.to_json

y = JSON.load_file('coffees.json', symbolize_names: true)
y << Coffee.to_json
p y
File.write('coffees.json', JSON.pretty_generate(y))

# parsed = JSON.load_file('coffees.json', symbolize_names: true)
# puts parsed

# Coffee.list

# p Coffee.list

# parsed << test

# File.write('coffees.json', JSON.pretty_generate(parsed))