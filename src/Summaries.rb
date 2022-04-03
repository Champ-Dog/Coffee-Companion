# This module provides summary functionality to the app, allowing stored data to summarised in an easily readable format
# for display and export. To avoid confusion between methods and aid troubleshooting, begin names with prefix
# 'summarise_'
module Summaries
  def summarise_bean
    return "#{@origin} #{@name}"
  end

  # Calling this method with puts (i.e., 'puts (coffee).summarise_recipe') will display a well-formatted, easily read
  # summary of stored recipes. This method can also be used for exporting to .txt using ((file).puts)
  def summarise_recipe
    output = ["Recipe Summary:"]
    recipe_summary.each do |index|
      output << "#{index}"
    end
    return output
  end

  # This method gathers stored cupping notes together to pass to the 'summarise_cupping' method before display/export
  def summarise_notes
    notes = []
    notes << highlight.flatten.join(' ')
    notes << minimise.flatten.join(' ')
    notes << tactile.flatten.join(' ')
    return notes
  end

  # Calling this method with puts (i.e., 'puts (coffee).summarise_cupping') will display a well-formatted, easily read
  # summary of stored cupping notes. This method can also be used for exporting to .txt using ((file).puts)
  def summarise_cupping
    headings = %w[Highlight Minimise Tactile]
    output = []
    headings.zip(summarise_notes).each do |index, descriptors|
      output << ''
      output << index
      output << descriptors
    end
    return output
  end
  
  def summarise
    summarise_bean
    summarise_notes
    summarise_cupping
  end
end
# def summarise(coffee)
#   puts coffee.bean_summary
#   puts ''
#   puts "Recipe Summary:"
#   coffee.recipe_summary.each do |index|
#     puts "#{index}"
#   end
#   puts ''
  # puts "Highlight:"
  # puts coffee.highlight
  # puts ''
  # puts "Minimise:"
  # puts coffee.minimise
  # puts ''
  # puts "Tactile:"
  # puts coffee.tactile
  # puts ''
  # puts "Recipes:"
  # puts coffee.recipes