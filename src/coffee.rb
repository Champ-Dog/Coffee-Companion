
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

  def list
    return @@coffees
  end
end

# kamwangi = Coffee.new('kenya', 'kamwangi')
# gachatha = Coffee.new('kenya', 'gachatha')

# kamwangi.highlight << 'blackberry, apple'
# kamwangi.highlight << 'orange'


# p kamwangi.list