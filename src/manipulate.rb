require "tty-prompt"
# require_relative './coffee'
require_relative './prompt'

# This module contains the control structure and methods necessary to edit or export information about a coffee.
# Selection is handled outside of this module.
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

  def self.descriptor_changer(new_descriptor, coffee)
    (new_descriptor[0]).empty? ? nil : coffee.highlight = new_descriptor[0]
    (new_descriptor[1]).empty? ? nil : coffee.minimise = new_descriptor[1]
    (new_descriptor[2]).empty? ? nil : coffee.tactile = new_descriptor[2]
  end

  def self.bean_changer
    prompt = TTY::Prompt.new
    new_value = prompt.ask("Please enter new value") do |input|
      input.required(true, 'New value is required to continue, or re-enter previous value')
    end
    return new_value
  end

  def self.export_coffee(coffee)
    file = File.open("report.txt", "a")
    file.puts coffee.summarise
    file.puts ''
    file.close
  end

end