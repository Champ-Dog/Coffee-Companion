require './coffee'
require 'json'
require "tty-prompt"
require './prompt'

prompt = TTY::Prompt.new
system "clear"
new_coffee = []
puts "Welcome to the Coffee Companion"
welcome = prompt.select("What would you like to do?", %w(Create Edit Search Exit))

if welcome == 'Create'
  new_coffee << create 
  add_more
elsif welcome == 'Exit'
  puts 'Goodbye'
else
  puts 'Not configured!'
end

p new_coffee.flatten

# y = JSON.load_file('coffees.json', symbolize_names: true)
# y << Coffee.to_json
# p y
# File.write('coffees.json', JSON.pretty_generate(y))

# parsed = JSON.load_file('coffees.json', symbolize_names: true)
# puts parsed

# Coffee.list

# p Coffee.list

# parsed << test

# File.write('coffees.json', JSON.pretty_generate(parsed))
