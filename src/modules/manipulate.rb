require "tty-prompt"
require "pastel"
require "oj"

require_relative './coffee'

# This module contains the control flow structures and helper methods necessary to edit or export stored information
# about a coffee.
module Manipulate
  def self.run_manipulate(coffee)
    prompt = TTY::Prompt.new
    pastel = Pastel.new
    manipulate_coffee = prompt.select(pastel.blue("What would you like to do?"), %w(Edit Export Delete Cancel), cycle: true)
    until manipulate_coffee == 'Cancel'
      case manipulate_coffee
      when 'Edit'
        Manipulate.edit_coffee(coffee)
        manipulate_coffee = prompt.select(pastel.blue("What would you like to do?"), %w(Edit Export Delete Cancel), cycle: true)
      when 'Export'
        Manipulate.coffee_exporter(coffee)
        manipulate_coffee = prompt.select(pastel.blue("What would you like to do?"), %w(Edit Export Delete Cancel), cycle: true)
      when 'Delete'
        coffee.self_destruct
        break
      end
    end
  end

  def self.edit_coffee(coffee)
    prompt = TTY::Prompt.new
    pastel = Pastel.new
    edit_this = prompt.select(pastel.blue("What would you like to edit?"), %w(Origin Name Cupping_Notes Recipes Cancel), cycle: true)
    until edit_this == 'Cancel'
      case edit_this
      when 'Origin'
        coffee.origin = Manipulate.change_bean
        edit_this = prompt.select(pastel.blue("What would you like to edit?"), %w(Origin Name Cupping_Notes Recipes Cancel), cycle: true)
      when 'Name'
        coffee.name = Manipulate.change_bean
        edit_this = prompt.select(pastel.blue("What would you like to edit?"), %w(Origin Name Cupping_Notes Recipes Cancel), cycle: true)
      when 'Cupping_Notes'
        Create.add_descriptors(coffee)
        edit_this = prompt.select(pastel.blue("What would you like to edit?"), %w(Origin Name Cupping_Notes Recipes Cancel), cycle: true)
      when 'Recipes'
        Manipulate.edit_recipes(coffee)
        edit_this = prompt.select(pastel.blue("What would you like to edit?"), %w(Origin Name Cupping_Notes Recipes Cancel), cycle: true)
      end
    end
  end

  def self.edit_recipes(coffee)
    prompt = TTY::Prompt.new
    pastel = Pastel.new
    begin
      edit_add = prompt.select(pastel.blue("What would you like to do?"), %w(Add_New Edit_Existing Cancel), cycle: true)
      case edit_add
      when 'Add_New'
        coffee.recipes << Create.build_recipe
      when 'Edit_Existing'
        Manipulate.change_recipe(coffee)
      end
    rescue NoMethodError
      puts 'No recipes yet!'
      retry
    end
  end

  def self.change_bean
    prompt = TTY::Prompt.new
    pastel = Pastel.new
    new_value = prompt.ask(pastel.blue("Please enter new value")) do |input|
      input.required(true, 'New value is required to continue, or re-enter previous value')
    end
    return new_value
  end

  def self.change_recipe(coffee)
    prompt = TTY::Prompt.new
    pastel = Pastel.new
    choices = coffee.recipe_hash
    selected = prompt.select(pastel.blue("Which recipe would you like to edit"), choices, cycle: true)
    case prompt.select(pastel.blue('What would you like to do?'), %w(Edit Remove), cycle: true)
    when 'Edit'
      coffee.recipes[selected - 1] = Create.build_recipe
    when 'Delete'
      coffee.recipe_remover(selected - 1)
    end
  end

  def self.search_type
    prompt = TTY::Prompt.new
    pastel = Pastel.new
    search_by = prompt.select(pastel.blue("How would you like to search"), %w(Name Origin), cycle: true)
    return search_by
  end

  def self.search_term
    prompt = TTY::Prompt.new
    pastel = Pastel.new
    search_for = prompt.ask(pastel.blue("Please enter the term to search for")) do |search_term|
      search_term.modify :capitalize
    end
    return search_for
  end

  # This method is called on startup to rebuild stored coffees from 'coffees.json' Also provides critical
  # error-avoidance by checking there are coffees to restore before beginning.
  def self.rebuild_coffees
    stored_coffees = Oj.load_file('./coffees.json')
    return nil if stored_coffees.nil?

    stored_coffees.each do |coffee|
      rebuilt_coffee = Coffee.new(coffee.origin, coffee.name)
      rebuilt_coffee.highlight << coffee.highlight
      rebuilt_coffee.minimise << coffee.minimise
      rebuilt_coffee.tactile << coffee.tactile
      rebuilt_coffee.recipes << coffee.recipes
    end
  end

  # This method is called on startup, after Manipulate.rebuild_coffees. It flattens the stored attribute information of
  # all coffees - rebuild_coffees results in multi-dimensional arrays; impacting app function. Flatten depth set to 1
  # for @recipes to preserve complete, separate recipes.
  def self.reshape_coffees
    Coffee.list.each do |coffee|
      coffee.highlight.flatten!
      coffee.minimise.flatten!
      coffee.tactile.flatten!
      coffee.recipes.flatten!(1)
    end
  end

  # Checks for new descriptor(@highlight, @minimise, @tactile) values and updates if present
  def self.descriptor_changer(new_descriptors, coffee)
    new_descriptors[0].nil? ? nil : coffee.highlight = [new_descriptors[0]]
    new_descriptors[1].nil? ? nil : coffee.minimise = [new_descriptors[1]]
    new_descriptors[2].nil? ? nil : coffee.tactile = [new_descriptors[2]]
  end

  def self.coffee_exporter(coffee)
    file = File.open("report.txt", "a")
    file.puts coffee.summarise
    file.puts ''
    file.close
  end
end
