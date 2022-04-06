# This module contains the methods called in response to command line arguments
module Arguments
  def about
  puts 'The Coffee Companion, developed by Champ-Dog'
  puts 'Version: 1.0.0, April 2022'
  puts 'With great coffee comes great responsibility'
  end

  def report_all
  Manipulate.coffee_exporter(Coffee.list)
  end

  def list_all
    Coffee.list.each do |bean|
        puts bean.summarise_bean
    end
  end
end
