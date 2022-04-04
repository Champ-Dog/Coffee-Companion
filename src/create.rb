require 'tty-prompt'

# This module contains the helper methods and flow control structures used when creating a new Coffee-class object.
module Create
  # This method is used to obtain user input to create a new coffee
  def self.prompt_bean
    prompt = TTY::Prompt.new
    result = prompt.collect do
      key(:origin).ask('Origin:', required: true, modify: :capitalize)
      key(:name).ask('Name:', required: true, modify: :capitalize)
    end
    return result[:origin], result[:name]
  end

  # This method is used obtain user input to create or edit a recipe
  def self.prompt_recipe
    prompt = TTY::Prompt.new
    result = prompt.collect do
      key(:dose).ask('Dose:', convert: :float)
      key(:yield).ask('Yield:', convert: :float)
      key(:time).ask('Time:', convert: :integer)
      key(:tds).ask('TDS:', convert: :float)
    end
    return [result[:dose], result[:yield], result[:time], result[:tds]]
  end

  # Creates a new recipe
  def self.build_recipe
    build_recipe = []
    build_recipe << Create.prompt_recipe
    build_recipe.flatten!
    build_recipe << Calculators.return_extraction(build_recipe[0], build_recipe[1], build_recipe[3])
    return build_recipe.flatten
  end

  # Checks for new descriptor(@highlight, @minimise, @tactile) values and updates if present
  def self.descriptor_changer(new_descriptors, coffee)
    new_descriptors[0].nil? ? nil : coffee.highlight = [new_descriptors[0]]
    new_descriptors[1].nil? ? nil : coffee.minimise = [new_descriptors[1]]
    new_descriptors[2].nil? ? nil : coffee.tactile = [new_descriptors[2]]
  end

  def self.add_descriptors(coffee)
    new_descriptors = cupping_notes
    new_descriptors.flatten!
    coffee.highlight << new_descriptors[0]
    coffee.minimise << new_descriptors[1]
    coffee.tactile << new_descriptors[2]
  end
end
