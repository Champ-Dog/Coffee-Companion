# require 'oj'
require './coffee'
# require './prompt'
require "tty-prompt"
# require 'tty-file'

kamwangi = Coffee.new('kenya', 'kamwangi')
# # p kamwangi

kamwangi.recipes << [21.0, 50, 26, 8.5, 20.5]
kamwangi.recipes << [20, 55, 23, 8, 21.5]
kamwangi.recipes << [20.5, 53, 29, 9, 22]

# kamwangi.highlight << ["grapefruit", "orange", "raspberry"]
# kamwangi.minimise <<  "quinine, orange rind, burnt butter, pastry"
# kamwangi.tactile << "creamy, effervescent"
# kamwangi.highlight << ["grapefruit, orange, raspberry"]


# # p kamwangi.highlight


def recipe_hash(coffee)
    hash = {}
    x = 1
    coffee.recipes.each do |recipe|
        hash[:"#{recipe}"] = x
        x += 1
    end
    return hash
end

prompt = TTY::Prompt.new
choices = recipe_hash(kamwangi)
selected = prompt.select("Which recipe would you like to change?", choices)
p selected

# file = File.open("report.txt", "a")
# file.puts "Test Starts Here"
# file.puts kamwangi.summarise
# file.close


# # puts kamwangi.summarise_recipe
# # puts kamwangi.summarise_cupping
# # p kamwangi.summarise_recipe

# # file = File.open("report.txt", "a")
# # file.puts kamwangi.summarise_recipe
# # file.puts kamwangi.summarise_cupping
# # file.close

# # puts kamwangi.summarise_name

# # puts kamwangi

# # def kam_sum(coffee)
# # coffee.summarise_recipe.each do |index|
# #     puts "#{index}"
# #     puts ""
# #   end
# # end
# # # p kamwangi.recipes

# # puts summarise(kamwangi)

# # puts "this here"
# # puts kamwangi.summarise_recipe

# # def test_method(coffee)
# #     return coffee.highlight.flatten.to_s
# # end

# # def print_highlight(coffee)
# #     coffee.highlight.flatten!
# #     index = 0
# #     while index < (coffee.highlight.length - 1) do
# #         print "#{coffee.highlight[index]}, "
# #         index += 1
# #     end
# #     print "#{coffee.highlight[-1]}"
# # end

# # puts print_highlight(kamwangi)

# # def output_highlight(coffee)
# #     file = File.open("summaries.txt", "a")
# #     coffee.highlight.flatten!
# #     (coffee.highlight.length - 1).times do |index|
# #         file.print "#{coffee.highlight[index]}, "
# #     end
# #     file.print "#{coffee.highlight[-1]}"
# #     file.close
# # end

# # # puts output_highlight(kamwangi)

# # # 5.times do |index|
# # #       all_parameters << parameter(index)
# # #     end

# # def summary_to_file(coffee)
# #     file = File.open("summaries.txt", "a")

# #     file.puts coffee.summarise_name
# #     file.puts ''
# #     file.puts "Recipe:"
# #     file.puts coffee.summarise_recipe
# #     file.puts ''
# #     file.puts "Highlight:"

# #     file.puts ''
# #     file.puts ''
# #     file.puts "Minimise:"
# #     file.puts coffee.minimise
# #     file.puts ''
# #     file.puts "Tactile:"
# #     file.puts coffee.tactile

# #     file.close
# # end

# # puts "from here"

# # decaf = Coffee.new('Colombia', 'La Serrania')
# # test_coffee = Coffee.new('test', 'test')

# # pp Coffee.list
# # kamwangi.self_destruct
# # pp Coffee.list

# # pp kamwangi
# # puts "now"
# # puts ""
# # pp Coffee.list

# # # summary_to_file(kamwangi)

# # # file = File.open("summaries.txt", "a")
# # # file.puts "Highlight:"
# # # output_highlight(kamwangi)
# # # file.close
# # # # TTY::File.create_file "./kamwangi.txt"
# # # TTY::File.append_to_file("kamwangi.txt") do
# # #   "#{kamwangi.summarise_name}
  
# # #   Recipe:
# # #   #{kam_sum(kamwangi)}
  
# # #   Highlight:
# # #   #{kamwangi.highlight}
 
# # #   Minimise
# # #   #{kamwangi.minimise}
  
# # #   Tactile:
# # #   #{kamwangi.tactile}
# # #   "
# # # end

# # # def summarise(coffee) 
# # #   all_parameters = []
# # #   5.times do |index|
# # #     all_parameters << coffee.parameter(index)
# # #   end

# # #   headings = %w[Dose Yield Time TDS EXT]
# # #   headings.zip(all_parameters).each do |index, value|
# # #     puts "#{index}: #{value[0]} - #{value[-1]}"
# # #   end
# # # end

# # # summarise(kamwangi)

# # # kamwangi.highlight << 'other good thing, niceness'
# # # # p kamwangi.recipes

# # # # x = Oj.load_file('./coffees.json')

# # # # x.each do |coffee|
# # # #     coffee = Coffee.new(coffee.origin, coffee.name, coffee.highlight.flatten, coffee.minimise.flatten, coffee.tactile.flatten, coffee.recipes)
# # # # end

# # # # Coffee.list.each do |coffee|
# # # #     coffee.highlight.flatten!
# # # #     coffee.minimise.flatten!
# # # #     coffee.tactile.flatten!
# # # #     coffee.recipes.flatten!
# # # # end

# # # p Coffee.list



# # # # def Coffee Reader
# # # puts "#{kamwangi.origin} #{kamwangi.name}"
# # # puts ''
# # puts "Highlight:"
# # puts kamwangi.highlight
# # puts ''
# # puts "Minimise:"
# # puts kamwangi.minimise[0]
# # puts ''
# # puts "Tactile:"
# # puts kamwangi.tactile[0]
# # puts ''
# # puts "Recipes:"

# # # foo = %w[Dose Yield Time TDS EXT]
# # #   foo.each do |index|
# # #     print "#{index}: "
# # #   end


# #     params = []
# #     # max = 0
# #     # min = 100
# #     y = 0
# # while y < 5 do
# #   max = 0
# #   min = 100
# #   kamwangi.recipes.each do |recipe|
# #     if recipe[y] > max 
# #       max = recipe[y]
# #     elsif recipe[y] < min
# #       min = recipe[y]
# #     end
# #     # puts "#{write_summary(y)} #{min} - #{max}"
# #   end
# #   params << [min, max]
# #   y += 1
# # end

# # #   t = 0
# # foo = %w[Dose Yield Time TDS EXT]
# # foo.zip(params).each do |index, value|
# #   puts "#{index}: #{value[0]} - #{value[1]}"
# # end


# # #     puts "Dose: #{min}-#{max}"

# # #     x = 0
# # #     kamwangi.recipes. each do |recipe|
# # #         if recipe[1] > x 
# # #             x = recipe[1]
# # #         end
# # #     end
    
# # #     max = x

# # #      kamwangi.recipes. each do |recipe|
# # #         if recipe[1] < x 
# # #             x = recipe[1]
# # #         end
# # #     end

# # #     min = x

# # #     puts "Yield: #{min}-#{max}"
# # # #----------------------------
# # #     x = 0
# # #     kamwangi.recipes. each do |recipe|
# # #         if recipe[3] > x 
# # #             x = recipe[3]
# # #         end
# # #     end
    
  
# # #     max = x

# # #      kamwangi.recipes. each do |recipe|
# # #         if recipe[3] < x 
# # #             x = recipe[3]
# # #         end
# # #     end

# # #     min = x

# # #     puts "TDS: #{min}-#{max}"
# # # #-----------------------------
# # #     x = 0
# # #     kamwangi.recipes. each do |recipe|
# # #         if recipe[4] > x 
# # #             x = recipe[4]
# # #         end
# # #     end
    
    
# # #     max = x

# # #      kamwangi.recipes. each do |recipe|
# # #         if recipe[4] < x 
# # #             x = recipe[4]
# # #         end
# # #     end

# # #     min = x

# # #     puts "EXT: #{min}-#{max}"
# # # end


# # # Coffee.list << x
# # # puts "New coffee list"
# # # p Coffee.list

# # # puts
# # # p Coffee

# # # kamwangi = Coffee.new('kenya', 'kamwangi')
# # # gacatha = Coffee.new('kenya', 'gachatha')
# # # decaf = Coffee.new('colombia', 'la serrania')
# # # puts "Updated list now"
# # # p (Coffee.list[1]).name
# # # p (x[1]).name

# # # puts "New x"
# # # p Coffee.list

# # # Oj.to_file('./coffees.json', x)

x = [[]]
y = []
y << x[1]
p y