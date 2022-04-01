require './coffee'
require 'json'
require "tty-prompt"
require './prompt'
require 'oj'

# App start + welcome

prompt = TTY::Prompt.new
system "clear"

# Rebuilds coffees from coffees.json - flattening is required as stored arrays will be fed into class attribute arrays
stored_coffees = Oj.load_file('./coffees.json')
stored_coffees.each do |coffee|
    Coffee.new(coffee.origin, coffee.name, coffee.highlight, coffee.minimise, coffee.tactile, coffee.recipes)
end
Coffee.list.each do |coffee|
    coffee.highlight.flatten!
    coffee.minimise.flatten!
    coffee.tactile.flatten!
    coffee.recipes.flatten!
end

puts "Welcome to the Coffee Companion"

# Menu to navigate the app, and execute the correct methods based on user choice

welcome = prompt.select("What would you like to do?", %w(Create Edit Search Exit)) #style recommondation ignored for proper gem function
until welcome == 'Exit'
  case welcome
  when 'Create'
    # Create an array to hold user inputs when making new coffee
    # new_coffee = []
    new_coffee = create
    # p new_coffee
    new_coffee.flatten!
    build_coffee = Coffee.new("#{new_coffee[0]}", "#{new_coffee[1]}")
    add_more = prompt.select("Would you like to add more information?", %w(Cupping-Notes Recipe No))
    case add_more 
    when 'Cupping-Notes'
      new_coffee << cupping_notes
      build_coffee.highlight << new_coffee[2]
      build_coffee.minimise << new_coffee[3]
      build_coffee.tactile << new_coffee[4]
      puts 'New record created!'
    when 'Recipe'
      new_coffee = recipe
      build_coffee.recipes << new_coffee[2]
      puts 'New record created!'
    when 'No'
      puts 'New record created!'
      p build_coffee
      p Coffee.list
    end
    welcome = prompt.select("What would you like to do?", %w(Create Edit Search Exit))
  when 'Search'
    type = search_type
    term = search_term
    case type
    when 'Name'
      results = Coffee.search_name(term)
    when 'Origin'
      results = Coffee.search_origin(term)
    end

    # From results, create list of just names
    if results.empty? == true
      puts "No matches found"
    else
      puts "Found the following matches:"
      results.each.with_index(1) do |match, index|
        puts "#{index}. #{match.name}"
      end
      selection = prompt.ask("Please enter a selection (1/2/etc)", convert: :int)
      selected_object = results[selection - 1]
      p selected_object
    end
    welcome = prompt.select("What would you like to do?", %w(Create Edit Search Exit))
  when 'Exit'
    puts 'Goodbye'
  else
    puts 'Option not configured, please restart app'
    break
  end
end

save_coffees = Coffee.list
Oj.to_file('./coffees.json', save_coffees)
p save_coffees
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
