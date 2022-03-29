
class Coffee
  attr_accessor :origin, :name, :highlight, :minimise, :tactile, :recipes

  @@coffees = []

  def initialize(origin, name)
    @origin = origin.capitalize
    @name = name.capitalize
    @highlight = []
    @minimise = []
    @tactile = []
    @recipes = []

    @@coffees << self
  end

  def self.list
    return @@coffees
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

# kamwangi = Coffee.new('kenya', 'kamwangi')
# gachatha = Coffee.new('kenya', 'gachatha')

# # kamwangi.highlight << 'blackberry, apple'
# # kamwangi.highlight << 'orange'


# p Coffee.list
