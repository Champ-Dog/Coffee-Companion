# This module contains the methods called in response to command line arguments
module Arguments
  def self.about
  puts 'The Coffee Companion, developed by Champ-Dog'
  puts 'Version: 1.0.0, April 2022'
  puts 'With great coffee comes great responsibility'
  exit
  end

  def self.report_all
    Coffee.list.each do |bean|
      Manipulate.coffee_exporter(bean)
    end
    exit
  end

  def self.list_all
    Coffee.list.each do |bean|
        puts bean.summarise_bean
    end
    exit
  end

  def self.help
    help = File.open('help.txt', 'r')
    puts help.readlines
    help.close
    exit
  end
end
