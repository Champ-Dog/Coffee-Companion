require 'oj'
require_relative './coffee'
require './prompt'
require 'tty-file'

kamwangi = Coffee.new('kenya', 'kamwangi')
# # p kamwangi

kamwangi.recipes << [21.0, 50, 26, 8.5, 20.5]
kamwangi.recipes << [20, 55, 23, 8, 21.5]
kamwangi.recipes << [20.5, 53, 29, 9, 22]

kamwangi.highlight << ["grapefruit", "orange", "raspberry"]
kamwangi.minimise <<  "quinine, orange rind, burnt butter, pastry"
kamwangi.tactile << "creamy, effervescent"
kamwangi.highlight << ["grapefruit, orange, raspberry"]

# p Coffee.list

# Select Coffee
# Select attribute

def attribute_changer
  prompt = TTY::Prompt.new
  new_value = prompt.ask("Please enter new value") do |input|
    input.required(true, 'New value is required')
  end
  return new_value
end

def recipe_hash(coffee)
  recipe_hash = {}
  coffee.recipes.each.with_index(1) do |recipe, index|
    recipe_hash[recipe] = index
  end
  return recipe_hash
end

p recipe_hash(kamwangi)
# choices =  recipe_hash(kamwangi)

def select_recipe(choices)
  prompt = TTY::Prompt.new
  edit_this = prompt.select("What would you like to edit?", choices)
  return edit_this
end




# RECIPES NEEDS TO FUNCTION DIFFERENTLY

def attribute_selector(coffee)
  prompt = TTY::Prompt.new
  edit_this = prompt.select("What would you like to edit?", %w(Origin Name Highlight Minimise Tactile Recipes Cancel))
  case edit_this
  when 'Origin'
    coffee.origin = attribute_changer
  when 'Name'
    coffee.name = attribute_changer
  when 'Highlight'
    coffee.highlight = attribute_changer
  when 'Minimise'
    coffee.minimise = attribute_changer
  when 'Tactile'
    coffee.tactile = attribute_changer
  when 'Recipes'
    choices = recipe_hash(coffee)
    recipe_to_change = select_recipe(choices) 
    coffee.recipes[recipe_to_change - 1] = attribute_changer
  when 'Cancel'
    puts 'Cancelled'
  end
end
  

attribute_selector(kamwangi)
p kamwangi

# recipe_changer(kamwangi)

# Display current value
# Enter new value
# Confirm
# Change