require_relative './coffee'
require 'json'
require "tty-prompt"
require "pastel"
require 'oj'
require_relative './manipulate'
require_relative './create'



# Call tty-prompt for main loop + clear screen.

prompt = TTY::Prompt.new
pastel = Pastel.new
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
pastel.blue
# App start + welcome

puts pastel.blue("Welcome to the ", pastel.red.underline("Coffee Companion"))

# Main program loop
# Note that throughout the app several style guide suggestions must be ignored for tty-prompt to function.

welcome = prompt.select(pastel.blue("What would you like to do?"), %w(Create Search Exit)) 
until welcome == 'Exit'
  system "clear"
  case welcome
  when 'Create'
    new_bean = Create.prompt_bean
    new_bean.flatten!
    new_coffee = Coffee.new(new_bean[0], new_bean[1])
    add_more = prompt.select(pastel.blue("Would you like to add more information?"), %w(Cupping-Notes Recipe No))
    case add_more
    when 'Cupping-Notes'
      Create.add_descriptors(new_coffee)
    when 'Recipe'
      new_coffee.recipes << Create.build_recipe
    end
    puts 'New record created!'
    welcome = prompt.select(pastel.blue("What would you like to do?"), %w(Create Search Exit))
  when 'Search'
    type = Manipulate.search_type
    term = Manipulate.search_term
    case type
    when 'Name'
      results = Coffee.search_name(term)
    when 'Origin'
      results = Coffee.search_origin(term)
    end
    if results.empty? == true
      puts "No matches found"
    else
      puts "Found the following matches:"
      results.each.with_index(1) do |match, index|
        puts "#{index}. #{match.name}"
      end
      selection = prompt.ask(pastel.blue("Please enter a selection (1/2/etc)"), convert: :int)
      selected_object = results[selection - 1]
      system "clear"
      puts selected_object.summarise
      selected_object.recipes.each do |recipe|
        print recipe
      end
      puts ''
      Manipulate.run_manipulate(selected_object)
    end
    welcome = prompt.select(pastel.blue("What would you like to do?"), %w(Create Search Exit))
  when 'Exit'
    puts 'Goodbye'
  else
    puts 'Option not configured, please restart app'
    break
  end
end

save_coffees = Coffee.list
Oj.to_file('./coffees.json', save_coffees)
