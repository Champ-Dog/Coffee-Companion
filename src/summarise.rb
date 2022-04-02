require './coffee'

def display(coffee)
    puts "#{coffee.origin} #{coffee.name}"
    puts ''
    puts 'Recipe'
    puts "#{summarise.coffee}"
    puts 'Highlight:'
    puts coffee.highlight
    puts ''
    puts 'Minimise:'
    puts coffee.minimise[0]
    puts ''
    puts 'Tactile:'
    puts coffee.tactile[0]
end

display