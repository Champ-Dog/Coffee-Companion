require "tty-prompt"
# require_relative './coffee'
require_relative './prompt'

# This module contains the flow control structures and helper methods necessary to edit or export stored information
# about a coffee.
module Manipulate
  def self.run_manipulate(coffee)
    prompt = TTY::Prompt.new
    manipulate_coffee = prompt.select("What would you like to do?", %w(Edit Export Delete Cancel))
    until manipulate_coffee == 'Cancel'
      case manipulate_coffee
      when 'Edit'
        edit_coffee(coffee)
        manipulate_coffee = prompt.select("What would you like to do?", %w(Edit Export Delete Cancel))
      when 'Export'
        export_coffee(coffee)
        manipulate_coffee = prompt.select("What would you like to do?", %w(Edit Export Delete Cancel))
      when 'Delete'
        coffee.self_destruct
        break
      end
    end
  end

  def self.edit_coffee(coffee)
    prompt = TTY::Prompt.new
    edit_this = prompt.select("What would you like to edit?", %w(Origin Name Cupping-Notes Recipes Cancel))
    until edit_this == 'Cancel'
      case edit_this
      when 'Origin'
        coffee.origin = Manipulate.bean_changer
        edit_this = prompt.select("What would you like to edit?", %w(Origin Name Cupping-Notes Recipes Cancel))
      when 'Name'
        coffee.name = Manipulate.bean_changer
        edit_this = prompt.select("What would you like to edit?", %w(Origin Name Cupping-Notes Recipes Cancel))
      when 'Cupping-Notes'
        update = []
        update << cupping_notes
        update.flatten!
        Manipulate.descriptor_changer(update, coffee)
        # (update[0]).empty? ? next : coffee.highlight = update[0]
        # (update[1]).empty? ? next : coffee.minimise = update[1]
        # (update[2]).empty? ? next : coffee.tactile = update[2]

        edit_this = prompt.select("What would you like to edit?", %w(Origin Name Cupping-Notes Recipes Cancel))
      when 'Recipes'
        choices = recipe_hash(coffee)
        recipe_to_change = select_recipe(choices)
        coffee.recipes[recipe_to_change - 1] = recipe
        edit_this = prompt.select("What would you like to edit?", %w(Origin Name Cupping-Notes Recipes Cancel))
      end
    end

  end

  def self.descriptor_changer(new_descriptors, coffee)
    !!new_descriptors[0] ? coffee.highlight = [new_descriptors[0]] : nil
    !!new_descriptors[1] ? coffee.minimise = [new_descriptors[1]] : nil
    !!new_descriptors[2] ? coffee.tactile = [new_descriptors[2]] : nil
  end

  def self.bean_changer
    prompt = TTY::Prompt.new
    new_value = prompt.ask("Please enter new value") do |input|
      input.required(true, 'New value is required to continue, or re-enter previous value')
    end
    return new_value
  end

  def self.recipe_changer(coffee)
    prompt = TTY::Prompt.new
    choices = coffee.recipe_hash
    selected = prompt.select("Which recipe would you like to edit", choices)
    coffee.recipes[selected - 1] = Create.build_recipe
  end

  def self.coffee_exporter(coffee)
    file = File.open("report.txt", "a")
    file.puts coffee.summarise
    file.puts ''
    file.close
  end

end