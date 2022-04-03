require_relative './coffee'
require 'json'
require "tty-prompt"
require_relative './prompt'
require 'oj'
require_relative './manipulate.rb'



# Call tty-prompt for main loop + clear screen.

prompt = TTY::Prompt.new
system "clear"

# Rebuilds coffees from coffees.json - flattening is required to avoid multi-dimensional arrays.
# Importantly, @recipes needs to have depth set to one on flatten, as seperate recipes need seperate arrays.

stored_coffees = Oj.load_file('./coffees.json')
stored_coffees.each do |coffee|
  rebuilt_coffee = Coffee.new(coffee.origin, coffee.name)
  rebuilt_coffee.highlight << coffee.highlight
  rebuilt_coffee.minimise << coffee.minimise
  rebuilt_coffee.tactile << coffee.tactile
  rebuilt_coffee.recipes << coffee.recipes
end
Coffee.list.each do |coffee|
    coffee.highlight.flatten!
    coffee.minimise.flatten!
    coffee.tactile.flatten!
    coffee.recipes.flatten!(1)
end

# App start + welcome

puts "Welcome to the Coffee Companion"

# Main program loop
# Note that throughout the app style-guide suggestions must be ignored for tty-prompt to function.

welcome = prompt.select("What would you like to do?", %w(Create Edit Search Exit)) 
until welcome == 'Exit'
  system "clear"
  case welcome
  when 'Create'
    new_coffee = create
    new_coffee.flatten!
    build_coffee = Coffee.new("#{new_coffee[0]}", "#{new_coffee[1]}")
    add_more = prompt.select("Would you like to add more information?", %w(Cupping-Notes Recipe No))
    case add_more
    when 'Cupping-Notes'
      new_coffee << cupping_notes
      new_coffee.flatten!
      build_coffee.highlight << new_coffee[2]
      build_coffee.minimise << new_coffee[3]
      build_coffee.tactile << new_coffee[4]
    when 'Recipe'
      build_coffee.recipes << recipe
    when 'No'
      p build_coffee
      p Coffee.list
    end
    puts 'New record created!'
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
      system "clear"
      selected_object.summarise
      include Manipulate
      run_manipulate(selected_object)


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
