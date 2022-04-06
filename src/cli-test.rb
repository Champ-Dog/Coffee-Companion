# require 'pastel'
# require_relative './modules/Manipulate'

# #   # display options to user
# # printf "what would you like to do?\n"
# # printf "  [i]nstall dependencies (DO THIS BEFORE TRYING TO RUN)\n";
# # printf "  [r]un\n";
# # printf "  [c]lear maps\n" ;
# # printf "Type c, r, or i and press enter\n";
# # # assign choice to variable
# # read;
# # CHOICE=${REPLY};


#   # echo "### INSTALLING BUNDLER ###"
#   # gem install bundler
#   # echo "### INSTALLING DEPENDENCIES###"
#   # bundle install
#   # echo "### DEPENDENCIES INSTALLED ###"
#   # echo "run './terra' again to continue"

#   # del coffees.json


# ARGV.each do |arg|
# 	if arg == '-h' || arg == '--help'
# 		help
# 		return
#   elsif arg == '-a' || arg == '--about'
#     about
#     return
#   elsif arg == '-r' || arg == '--report'
#     report_all
#     return
# end

# case ARGV[0].to_s
# when '-h'
# puts 'help things'
# when  "-help"
#   puts 'help things'
# when '-a' || '-about'
#   puts 'about this app'
# when '-r' || '-report'
#   puts 'report all'
# when '-l' || '-list'
#   Coffee.list.each do |bean|
#   puts coffee.summarise_bean
#   end
# when '-c' || '-clear'
#   prompt confirmation, if yes
#   Coffee.list.each.self_destruct
# else
#   puts 'No valid argument detected.'
#   puts 'Starting program' # run program
# end
# rescue Interrupt
#   system "clear"
#   puts 'You ended the program.'
# rescue StandardError
#   system "clear"
#   puts 'Sorry, an unexpected error occured. Ending program.'
# end


# def report_all
#   Manipulate.coffee_exporter(Coffee.list)
# end

# def about
#   puts pastel.blue("The ", pastel.red.underline("Coffee Companion"), pastel.blue(", developed by Champ-Dog"))
#   puts pastel.blue("Version: ", pastel.red.underline("1.0.0, April 2022"))
#   puts pastel.decorate("With great coffee comes great responsibility", :blue, :italic)
# end

require './modules/coffee'

Coffee.new('one', 'one')
Coffee.new('two', 'two')
Coffee.new('three', 'three')

def list
  Coffee.list.each do |bean|
    puts bean.summarise_bean
  end
end

list