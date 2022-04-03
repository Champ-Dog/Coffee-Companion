# This module provides summary functionality to the app, allowing stored data to summarised in an easily readable format
# for display and export.
module Summaries
  def summarise_name
    return "#{@origin} #{@name}"
  end

  # def display_name
  #   return

end

def summarise(coffee)
  puts coffee.summarise_name
  puts ''
  puts "Recipe Summary:"
  coffee.summarise_recipe.each do |index|
    puts "#{index}"
  end
  puts ''
  puts "Highlight:"
  puts coffee.highlight
  puts ''
  puts "Minimise:"
  puts coffee.minimise
  puts ''
  puts "Tactile:"
  puts coffee.tactile
  puts ''
  puts "Recipes:"
  puts coffee.recipes
end