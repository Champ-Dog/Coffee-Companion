
class Coffee
  attr_accessor :origin, :name, :highlight, :minimise, :tactile, :recipes

  @@coffees = []

  def initialize(origin, name, highlight = nil, minimise = nil, tactile = nil, recipes = nil)
    @origin = origin
    @name = name
    @highlight = %w{highlight}
    @minimise = [minimise]
    @tactile = [tactile]
    @recipes = [recipes]
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

  def to_json
    {
      origin: @origin,
      name: @name,
      highlight: @highlight,
      minimise: @minimise,
      tactile: @tactile,
      recipes: @recipes,
    }
  end

  def self.to_json
    @@coffees.map do |x|
      x.to_json
    end
  end
end
