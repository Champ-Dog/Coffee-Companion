# This module provides summary functionality to the Coffee class, allowing stored data to summarised in an easily readable format
# for display and export. To avoid confusion between methods and aid troubleshooting, begin names with prefix
# 'summarise_'
module Summaries
  def summarise_bean
    return "#{@origin.upcase} #{@name.upcase}"
  end

  # Calling this method with puts (i.e., 'puts (coffee).summarise_recipe') will display a well-formatted, easily read
  # summary of stored recipes. This method can also be used for exporting to .txt using ((file).puts)
  def summarise_recipe
    output = ["Recipe Summary:"]
    recipe_summary.each do |index|
      output << index
    end
    return output
  end

  # This method gathers stored cupping notes together to pass to the 'summarise_cupping' method before display/export
  def summarise_descriptors
    notes = []
    notes << @highlight.flatten.join(' ')
    notes << @minimise.flatten.join(' ')
    notes << @tactile.flatten.join(' ')
    return notes
  end

  # Calling this method with puts (i.e., 'puts (coffee).summarise_cupping') will display a well-formatted, easily read
  # summary of stored cupping notes. This method can also be used for exporting to .txt using ((file).puts)
  def summarise_cupping
    headings = %w[Highlight Minimise Tactile]
    output = []
    headings.zip(summarise_descriptors).each do |index, descriptors|
      output << ''
      output << index
      output << descriptors
    end
    return output
  end

  def summarise
    output = []
    output << summarise_bean
    output << summarise_recipe
    output << summarise_cupping
    return output
  end
end