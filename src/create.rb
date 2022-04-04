require 'tty-prompt'

# This module contains the methods and control structures used when creating a new Coffee-class object.
module Create
  # This method is used to obtain user input to create a new coffee
  def self.bean
    prompt = TTY::Prompt.new
    result = prompt.collect do
      key(:origin).ask('Origin:', required: true, modify: :capitalize)
      key(:name).ask('Name:', required: true, modify: :capitalize)
    end
    return result[:origin], result[:name]
  end

  # This method is used obtain user input to create or edit a recipe
  def self.recipe
    prompt = TTY::Prompt.new
    result = prompt.collect do
      key(:dose).ask('Dose:', convert: :float)
      key(:yield).ask('Yield:', convert: :float)
      key(:time).ask('Time:', convert: :integer)
      key(:tds).ask('TDS:', convert: :float)
    end
    return [result[:dose], result[:yield], result[:time], result[:tds]]
  end

end