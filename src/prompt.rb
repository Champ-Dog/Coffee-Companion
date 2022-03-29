require './coffee'
require 'json'
require "tty-prompt"

def create
  prompt = TTY::Prompt.new
  result = prompt.collect do
    key(:origin).ask('Origin:')
    key(:name).ask('Name:')
  end
  return result[:origin], result[:name]
#   x = Coffee.new("#{result[:origin]}", "#{result[:name]}") - THIS NEEDS TO BE ELSEWHERE TO MODULARISE METHODS
end

def add_more
  prompt = TTY::Prompt.new
  add_more = prompt.select("Would you like to add more information?", %w(Cupping-Notes Recipe No))
  if add_more == 'Cupping-Notes'
    cupping_notes
  elsif add_more == 'Recipe'
    recipe
  else
    puts 'New record created!'
  end
end

def cupping_notes
  prompt = TTY::Prompt.new
  result = prompt.collect do
    key(:highlight).ask('Highlight:')
    key(:minimise).ask('Minimise:')
    key(:tactile).ask('Tactile:')
  end
end

def calculate_extraction(dose, out, tds)
  solids = (tds/100) * out
  ext = solids/dose 
  return (ext.*100).round(2)
end

def recipe # - Need to enforce floats for responses
  prompt = TTY::Prompt.new
  result = prompt.collect do
    key(:dose).ask('Dose:', convert: :float)
    key(:yield).ask('Yield:', convert: :float)
    key(:time).ask('Time:', convert: :float)
    key(:tds).ask('TDS:', convert: :float) # Will they include percentage?
  end
    ext = calculate_extraction(result[:dose], result[:yield], result[:tds])
    puts "Your extraction is #{ext}"
    result[:ext] = ext
end


#   x.highlight << result[:highlight]
#   x.minimise << result[:minimise]
#   x.tactile << result[:tactile] - Elsewhere for modularity!
# end

# create
# p Coffee.list