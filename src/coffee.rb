
class Coffee
  attr_accessor :origin, :name, :highlight, :minimise, :tactile, :recipes

  @@coffees = []

  def initialize(origin, name)
    @origin = origin.capitalize
    @name = name.capitalize
    @highlight = [].flatten
    @minimise = [].flatten
    @tactile = [].flatten
    @recipes = []

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

  def self.search_name(name)
    @@coffees.select { |foo| foo.name == name }
  end

end

# kamwangi = Coffee.new('kenya', 'kamwangi')
# kamwangi = Coffee.new('kenya', 'kamwangi2')
# kamwangi = Coffee.new('kenya', 'kamwangi3')
# # gachatha = Coffee.new('kenya', 'gachatha')

# # # kamwangi.highlight << 'blackberry, apple'
# # # kamwangi.highlight << 'orange'


# puts Coffee.list
# p kamwangi
