require "tty-prompt"
require_relative './coffee'
require_relative './prompt'

# This module contains the control structure and methods necessary to edit or export information about a coffee.
# Selection is handled outside of this module.
module Manipulate
  def run_manipulate(coffee)
    prompt = TTY::Prompt.new
    manipulate_coffee = prompt.select("What would you like to do?", %w(Edit Export Delete Cancel))
    until manipulate_coffee == 'Cancel'
      case manipulate_coffee
      when 'Edit'
        edit_coffee(coffee)
      when 'Export'
        export_coffee(coffee)
      when 'Delete'
        coffee.self_destruct
      end
    end
  end

  def edit_coffee(coffee)
    prompt = TTY::Prompt.new
    edit_this = prompt.select("What would you like to edit?", %w(Origin Name Cupping-Notes Recipes Cancel))
    until edit_this == 'Cancel'
      case edit_this
      when 'Origin'
        coffee.origin = attribute_changer
      when 'Name'
        coffee.name = attribute_changer
      when 'Cupping-Notes'
        update = cupping_notes
        (update[0]).empty? ? next : coffee.highlight = update[0]
        (update[1]).empty? ? next : coffee.minimise = update[1]
        (update[2]).empty? ? next : coffee.tactile = update[2]
      when 'Recipes'
        choices = recipe_hash(coffee)
        recipe_to_change = select_recipe(choices) 
        coffee.recipes[recipe_to_change - 1] = recipe
      end
    end

  end

  def attribute_changer
    prompt = TTY::Prompt.new
    new_value = prompt.ask("Please enter new value") do |input|
      input.required(true, 'New value is required')
    end
    return new_value
  end

end