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
      key(:dose).ask('Dose:') do |input|
        input.required true
        input.convert(:float, 'Please enter numbers/decimals only')
      end
      key(:yield).ask('Yield:') do |input|
        input.required true
        input.convert(:integer, 'Please enter numbers/decimals only')
      end
      key(:time).ask('Time:') do |input|
        input.required true
        input.convert(:integer, 'Please enter numbers/decimals only')
      end
      key(:tds).ask('TDS:') do |input|
        input.required true
        input.convert(:float, 'Please enter numbers/decimals only')
      end
    end
    return [result[:dose], result[:yield], result[:time], result[:tds]]
  end

  def self.prompt_descriptors
    prompt = TTY::Prompt.new
    result = prompt.collect do
      key(:highlight).ask('Highlight:')
      key(:minimise).ask('Minimise:')
      key(:tactile).ask('Tactile:')
    end
    flavour = [result[:highlight], result[:minimise], result[:tactile]]
    return flavour
  end

  # Creates a new recipe
  def self.build_recipe
    build_recipe = []
    build_recipe << Create.prompt_recipe
    build_recipe.flatten!
    build_recipe << Calculators.return_extraction(build_recipe[0], build_recipe[1], build_recipe[3])
    return build_recipe.flatten
  end

  def self.add_descriptors(coffee)
    new_descriptors = Create.prompt_descriptors
    new_descriptors.flatten!
    new_descriptors[0].nil? ? nil : coffee.highlight = [new_descriptors[0]]
    new_descriptors[1].nil? ? nil : coffee.minimise = [new_descriptors[1]]
    new_descriptors[2].nil? ? nil : coffee.tactile = [new_descriptors[2]]
  end

end
