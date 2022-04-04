require_relative './coffee'
require 'json'
require 'tty-prompt'
require 'tty-file'

# prompt.ask("Enter text:") do |q|
#   q.modify :strip, :collapse
# end

include Calculators

#   x = Coffee.new("#{result[:origin]}", "#{result[:name]}") - THIS NEEDS TO BE ELSEWHERE TO MODULARISE METHODS
# def create
#   prompt = TTY::Prompt.new
#   result = prompt.collect do
#     key(:origin).ask('Origin:', required: true, modify: :capitalize)
#     key(:name).ask('Name:', required: true, modify: :capitalize)
#   end
#   return result[:origin], result[:name]
# end

# Defined here to be re-used in search/edit features
# def add_more
#   prompt = TTY::Prompt.new
#   new_info = []
#   add_more = prompt.select("Would you like to add more information?", %w(Cupping-Notes Recipe No))
#   case add_more 
#   when 'Cupping-Notes'
#     new_info << cupping_notes
#     puts 'New record created!'
#     return new_info
#   when 'Recipe'
#     new_info << recipe
#     puts 'New record created!'
#     return new_info
#   when 'No'
#     puts 'New record created!'
#   end
# end

def cupping_notes
  prompt = TTY::Prompt.new
  result = prompt.collect do
    key(:highlight).ask('Highlight:')
    key(:minimise).ask('Minimise:')
    key(:tactile).ask('Tactile:')
  end
  flavour = [result[:highlight], result[:minimise], result[:tactile]]
  return flavour
end

# def calculate_extraction(dose, out, tds)
#   solids = (tds / 100) * out
#   ext = solids / dose
#   return (ext * 100).round(2)
# end

# CHANGE CONVERSION ERROR MESSAGES
# REMOVE EXTRACTION DISPLAY AND EXPLAIN IT'S INCLUDED
# RETURN RESULT INSTEAD OF NEW VARIABLE
# WITH BOTH CHANGES ABC ACCEPTABLE
# def recipe
#   prompt = TTY::Prompt.new
#   result = prompt.collect do
#     key(:dose).ask('Dose:', convert: :float)
#     key(:yield).ask('Yield:', convert: :float)
#     key(:time).ask('Time:', convert: :integer)
#     key(:tds).ask('TDS:', convert: :float)
#   end
#   return [result[:dose], result[:yield], result[:time], result[:tds]]
# end
  # Below should be seperate method
# def getextract(1, 2, 3)
#   result[:ext] = return_extraction(result[:dose], result[:yield], result[:tds])
#   return [result[:dose], result[:yield], result[:time], result[:tds], result[:ext]]
# end

# Methods used for searching stored Coffee objects

# Skeleton for top-level search feature - module?
# def search
#   type = search_type
#   term = search_term
#   case type
#   when Name
#     results = Coffee.search_name(search_term)
#   when Origin
#     results = Coffee.search_origin(search_term)
#   end
#   return results
# end
# # From results, create list of just names
# case results.empty?
# when true
#   puts "No matches found"
# when false
#   puts "Found the following matches:"
#   results.each.with_index(1) do |match, index|
#     puts "#{index}. #{match.name}"
#   end
# end

# selection = prompt.ask("Please enter a selection (1/2/etc)", convert: :int)
# selected_object = results(selection - 1)

# What @attr does user want to change ?
# Show current value
# What is new value for @attr?
# Confirm new value

#------------------------------------------------

# Below are custom methods

def search_type
  prompt = TTY::Prompt.new
  search_by = prompt.select("How would you like to search", %w(Name Origin))
  return search_by
end

# INPUT MUST BE CAPITALIZED!
def search_term
  prompt = TTY::Prompt.new
  search_for = prompt.ask("Please enter the term to search for")
  return search_for
end

# Below are methods to produce Summary display


# def summarise_recipe(coffee) 
#   all_parameters = []
#   5.times do |index|
#     all_parameters << coffee.parameter(index)
#   end

#   headings = %w[Dose Yield Time TDS EXT]
#   headings.zip(all_parameters).each do |index, value|
#     puts "#{index}: #{value[0]} - #{value[-1]}"
#   end
# end

# def summarise(coffee)
#   puts coffee.summarise_name
#   puts ''
#   puts "Recipe Summary:"
#   coffee.summarise_recipe.each do |index|
#     puts "#{index}"
#   end
#   puts ''
#   puts "Highlight:"
#   puts coffee.highlight
#   puts ''
#   puts "Minimise:"
#   puts coffee.minimise
#   puts ''
#   puts "Tactile:"
#   puts coffee.tactile
#   puts ''
#   puts "Recipes:"
#   puts coffee.recipes
# end

# def output(coffee)
#   puts coffee.summarise_name
#   puts ''
#   puts "Recipe:"
#   coffee.recipe_summary.each do |index|
#     puts "#{index}"
#   end
#   puts ''
#   puts "Highlight:"
#   puts coffee.highlight
#   puts ''
#   puts "Minimise:"
#   puts coffee.minimise[0]
#   puts ''
#   puts "Tactile:"
#   puts coffee.tactile[0]
# end

#   prompt = TTY::Prompt.new
#   search_by = prompt.select("How would you like to search?", %w(Origin Name))
#   search_by == 'Origin' ? :
# end

#   x.highlight << result[:highlight]
#   x.minimise << result[:minimise]
#   x.tactile << result[:tactile] - Elsewhere for modularity!
# end

# create
# p Coffee.list