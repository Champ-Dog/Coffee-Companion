require_relative './recipes'
require_relative './summaries'

# This class does much of the heavy lifting for the app; substituting as a database to allow the storing, sorting, and
# manipulation of information about different coffees. Much of this functionality is provided through modules, used to
# separate related methods and attributes, and allowing for easier changes to the app in future.
class Coffee
  include Recipes
  include Summaries
  attr_accessor :origin, :name, :highlight, :minimise, :tactile, :recipes

  @@coffees = []

  def initialize(origin, name)
    recipe_initialize
    @origin = origin.capitalize
    @name = name.capitalize
    @highlight = []
    @minimise = []
    @tactile = []
    # @recipes = []
    # Self-populate class attribute @@coffees to track all class objects
    @@coffees << self
  end

  def self.list
    return @@coffees
  end

  def self.search_origin(origin)
    @@coffees.select { |bean| bean.origin == origin }
  end

  def self.search_name(name)
    @@coffees.select { |bean| bean.name == name }
  end

  def self_destruct
    Coffee.list.delete(self)
    puts "Coffee deleted!"
  end
end
