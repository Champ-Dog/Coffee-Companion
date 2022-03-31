require 'oj'
require './coffee'

kamwangi = Coffee.new('kenya', 'kamwangi', 'high', 'min', 'tact', [21, 56, 23, 9, 22.5])
# p kamwangi

kamwangi.recipes << [21, 50, 23, 8, 20.5]
kamwangi.recipes << [20, 50, 23, 8, 20.5]
p kamwangi.recipes

# x = Oj.load_file('./coffees.json')

# x.each do |coffee|
#     coffee = Coffee.new(coffee.origin, coffee.name, coffee.highlight.flatten, coffee.minimise.flatten, coffee.tactile.flatten, coffee.recipes)
# end

# Coffee.list.each do |coffee|
#     coffee.highlight.flatten!
#     coffee.minimise.flatten!
#     coffee.tactile.flatten!
#     coffee.recipes.flatten!
# end

p Coffee.list

# def Coffee Reader
    puts "#{kamwangi.origin} #{kamwangi.name}"
    puts ''
    puts "Highlight:"
    puts kamwangi.highlight[0]
    puts ''
    puts "Minimise:"
    puts kamwangi.minimise[0]
    puts ''
    puts "Tactile:"
    puts kamwangi.tactile[0]
    puts ''
    puts "Recipes:"
    kamwangi.recipes. each do |recipe|
        print "#{recipe} "
    end
    puts ''

# foo = %w[Dose Yield Time TDS EXT]
#   foo.each do |index|
#     print "#{index}: "
#   end


    params = []
    # max = 0
    # min = 100
    y = 0
while y < 5 do
  max = 0
  min = 100
  kamwangi.recipes.each do |recipe|
    if recipe[y] > max 
      max = recipe[y]
    end
    if recipe[y] < min
      min = recipe[y]
    end
    # puts "#{write_summary(y)} #{min} - #{max}"
  end
  params << [min, max]
  y += 1
end
  p params

#   t = 0
foo = %w[Dose Yield Time TDS EXT]
foo.zip(params).each do |index, value|
  puts "#{index}: #{value[0]} - #{value[1]}"
end


#     puts "Dose: #{min}-#{max}"

#     x = 0
#     kamwangi.recipes. each do |recipe|
#         if recipe[1] > x 
#             x = recipe[1]
#         end
#     end
    
#     max = x

#      kamwangi.recipes. each do |recipe|
#         if recipe[1] < x 
#             x = recipe[1]
#         end
#     end

#     min = x

#     puts "Yield: #{min}-#{max}"
# #----------------------------
#     x = 0
#     kamwangi.recipes. each do |recipe|
#         if recipe[3] > x 
#             x = recipe[3]
#         end
#     end
    
  
#     max = x

#      kamwangi.recipes. each do |recipe|
#         if recipe[3] < x 
#             x = recipe[3]
#         end
#     end

#     min = x

#     puts "TDS: #{min}-#{max}"
# #-----------------------------
#     x = 0
#     kamwangi.recipes. each do |recipe|
#         if recipe[4] > x 
#             x = recipe[4]
#         end
#     end
    
    
#     max = x

#      kamwangi.recipes. each do |recipe|
#         if recipe[4] < x 
#             x = recipe[4]
#         end
#     end

#     min = x

#     puts "EXT: #{min}-#{max}"
# end


# Coffee.list << x
# puts "New coffee list"
# p Coffee.list

# puts
# p Coffee

# kamwangi = Coffee.new('kenya', 'kamwangi')
# gacatha = Coffee.new('kenya', 'gachatha')
# decaf = Coffee.new('colombia', 'la serrania')
# puts "Updated list now"
# p (Coffee.list[1]).name
# p (x[1]).name

# puts "New x"
# p Coffee.list

# Oj.to_file('./coffees.json', x)