# The following two sections check that dependencies are available before launching the main loop of the app.
begin
  require 'json'
  require "tty-prompt"
  require "pastel"
  require 'oj'
rescue LoadError
  puts 'Sorry, an error occurred loading dependencies'
  puts 'Please follow setup instructions in README, and try again'
end

begin
  require_relative './modules/args'
  require_relative './modules/coffee'
  require_relative './modules/manipulate'
  require_relative './modules/create'
rescue LoadError
  puts 'Necessary files missing'
  puts 'Please rebuild app from source repository'
rescue StandardError
   puts 'Sorry, an unexpected error occured. Ending program.'
end

# Rebuilds coffees from coffees.json - flattening is required to avoid multi-dimensional arrays.
# Importantly, @recipes needs to have depth set to one on flatten, as seperate recipes need seperate arrays.
Manipulate.rebuild_coffees
Manipulate.reshape_coffees

# This responds to any CLI arguments provided
begin
  ARGV.include?('-a') ? Arguments.about : nil
  ARGV.include?('-l') ? Arguments.list_all : nil
  ARGV.include?('-h') ? Arguments.help : nil
  ARGV.include?('-r') ? Arguments.report_all : nil
rescue Interrupt
  system "clear"
  puts 'You ended the program.'
rescue StandardError
  system "clear"
  puts 'Sorry, an unexpected error occured. Ending program.'
end

prompt = TTY::Prompt.new
pastel = Pastel.new
system "clear"
puts pastel.blue("Welcome to the ", pastel.red.underline("Coffee Companion"))

# Main program loop
begin
  welcome = prompt.select(pastel.blue("What would you like to do?"), %w(Create Search Exit), cycle: true) 
  until welcome == 'Exit'
    system "clear"
    case welcome
    when 'Create'
      new_bean = Create.prompt_bean
      new_bean.flatten!
      new_coffee = Coffee.new(new_bean[0], new_bean[1])
      add_more = prompt.select(pastel.blue("Would you like to add more information?"), %w(Cupping-Notes Recipe No), cycle: true)
      case add_more
      when 'Cupping-Notes'
        Create.add_descriptors(new_coffee)
      when 'Recipe'
        new_coffee.recipes << Create.build_recipe
      end
      puts 'New record created!'
      welcome = prompt.select(pastel.blue("What would you like to do?"), %w(Create Search Exit), cycle: true)
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
        puts ''
        puts 'All Recipes:'
        selected_object.recipes.each do |recipe|
          print recipe
        end
        puts ''
        Manipulate.run_manipulate(selected_object)
      end
      welcome = prompt.select(pastel.blue("What would you like to do?"), %w(Create Search Exit), cycle: true)
    end
  end
rescue Interrupt
  system "clear"
  puts 'You ended the program.'
rescue StandardError
  system "clear"
  puts 'Sorry, an unexpected error occured. Ending program.'
end

puts pastel.blue('Thank you for using the ', pastel.red.underline('Coffee Companion'))
puts pastel.blue('Goodbye!')

begin
  save_coffees = Coffee.list
  Oj.to_file('./coffees.json', save_coffees)
rescue StandardError
  puts 'Sorry, an unexpected error occured.'
  puts 'Unable to save coffees. Ending program'
end
