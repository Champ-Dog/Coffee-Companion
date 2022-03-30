require './coffee'
require 'json'
require "tty-prompt"
require './prompt'

# App start + welcome

prompt = TTY::Prompt.new
system "clear"
new_coffee = []
puts "Welcome to the Coffee Companion"

# Menu to navigate the app, and execute the correct methods based on user choice

welcome = prompt.select("What would you like to do?", %w(Create Edit Search Exit)) #style recommondation ignored for proper gem function
case welcome
when 'Create'
  new_coffee << create
  new_coffee << add_more
  # next
when 'Search'
  type = search_type
  term = search_term
  if type == 'Name'
    results = Coffee.search_name(term)
  elsif type == 'Origin'
    results = Coffee.search_origin(term)
  end

   # From results, create list of just names
  if results.empty? == true
    puts "No matches found"
  elsif results.empty? == false
    puts "Found the following matches:"
    results.each.with_index(1) do |match, index|
      puts "#{index}. #{match.name}"
    end
  end
  selection = prompt.ask("Please enter a selection (1/2/etc)", convert: :int)
  selected_object = results(selection - 1)
  p selected_object
when 'Exit'
  puts 'Goodbye'
else
  puts 'Not configured!'
end

p new_coffee.flatten(1)
# .flatten(1)  - DON'T FLATTEN IN PRODUCTION! NEED CONTENTS SEPARATE TO PRESERVE ATTRIBUTE SEPARATION

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
