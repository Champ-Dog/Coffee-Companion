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

  # This method groups all values for each @recipe parameter into seperate arrays e.g., an array with each recorded
  # dose, one with each recorded yield, etc. Refer to 'recipes_spec.rb' for specifics. This information is used in
  # 'recipe_summary' (below); and is not called elsewhere.
  def recipe_values(index)
    values = []
    @recipes.each do |recipe|
      values << recipe[index]
    end
    return values.sort
  end

  # This returns and formats a range (as 'min - max') for each recipe parameter; summarising the collected recipes
  # of a coffee for easier reporting. Refer to 'recipes_spec.rb' for specifics.
  def recipe_summary
    all_parameters = []
    5.times do |index|
        all_parameters << recipe_values(index)
    end

    headings = %w[Dose Yield Time TDS EXT]
    output = []
    headings.zip(all_parameters).each do |index, value|
      output << "#{index}: #{value[0]} - #{value[-1]}"
    end
    return output
  end
end