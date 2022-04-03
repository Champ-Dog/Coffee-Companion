require_relative './calculators'

# This module introduces recipe functionality to coffees. Recipes have been seperated from other attributes of the
# Coffee class as they behave slightly differently. Individual recipes need to remain as seperate arrays; whereas all
# flavour descriptors of a given attribute (e.g., @highlight) can be treated as one, or multiple, string objects with
# minimal impact on performance. As a result, the editing, manipulation, and exporting, of recipes needs to be
# handled differently. The @recipe attribute also requires calculation methods unnecessary for other attributes.
module Recipes
  include Calculators
  attr_accessor :recipes

  def recipe_initialize
    @recipes = []
  end

  # def calculate_extraction(dose, out, tds)
  #   solids = (tds / 100) * out
  #   ext = solids / dose
  #   return (ext * 100).round(2)
  # end

  def parameter(index)
    parameter = []
    @recipes.each do |recipe|
      parameter << recipe[index]
    end
    return parameter.sort
  end

  def summarise_recipe
    all_parameters = []
    5.times do |index|
        all_parameters << parameter(index)
    end

    headings = %w[Dose Yield Time TDS EXT]
    output = []
    headings.zip(all_parameters).each do |index, value|
        output << "#{index}: #{value[0]} - #{value[-1]}"
    end
    return output
  end


end