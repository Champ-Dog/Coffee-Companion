
class Coffee
  attr_accessor :origin, :name, :highlight, :minimise, :tactile, :recipes

  def initialize(origin, name)
    @origin = origin.capitalize
    @name = name.capitalize
    @highlight = []
    @minimise = []
    @tactile = []
    @recipes = []
  end
end