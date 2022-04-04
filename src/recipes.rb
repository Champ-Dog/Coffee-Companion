require_relative './calculators'

# This module introduces recipe functionality to coffees. Recipes have been seperated from other attributes of the
# Coffee class as they behave slightly differently. Individual recipes need to remain as seperate arrays; whereas all
# flavour descriptors of a given attribute (e.g., @highlight) can be treated as one, or multiple, string objects with
# minimal impact on performance. As a result, the editing, manipulation, and exporting, of recipes needs to be
# handled differently. The @recipe attribute also requires calculation methods unnecessary for other attributes.
# To avoid confusion between methods and aid troubleshooting, begin names with prefix 'recipe_'
module Recipes
  include Calculators
  attr_accessor :recipes

  def recipe_initialize
    @recipes = []
  end

  # This returns an array containing all values for a given recipe parameter (e.g., Dose) Refer to 'recipes_spec.rb' for
  # specifics.
  def recipe_values(index)
    values = []
    @recipes.each do |recipe|
      values << recipe[index]
    end
    return values.sort
  end

  # This calls 'recipe_values' for each parameter of a recipe (i.e., Dose, Yield, Time, TDS, EXT); returning the
  # combined output as an array to be fed to 'recipe_summary'. Refer to 'recipes_spec.rb' for specifics.
  def recipe_grouper
    all_parameters = []
    5.times do |index|
      all_parameters << recipe_values(index)
    end
    return all_parameters
  end

  # This outputs the minimum and maximum values for each recipe parameter, along with an appropriate label, in the 
  # format 'parameter: min - max'. Refer to 'recipes_spec.rb' for specifics.
  def recipe_summary
    headings = %w[Dose Yield Time TDS EXT]
    output = []
    headings.zip(recipe_grouper).each do |index, value|
      output << "#{index}: #{value[0]} - #{value[-1]}"
    end
    return output
  end
end