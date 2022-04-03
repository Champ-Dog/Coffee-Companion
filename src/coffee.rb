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

  def summarise_name
    return "#{@origin} #{@name}"
  end

  def parameter(index)
    parameter = []
    @recipes.each do |recipe|
      parameter << recipe[index]
    end
    return parameter.sort
  end

  def summarise_recipe
    all_parameters = []
    5.times do |index|
      all_parameters << parameter(index)
    end

    headings = %w[Dose Yield Time TDS EXT]
    output = []
    headings.zip(all_parameters).each do |index, value|
      output << "#{index}: #{value[0]} - #{value[-1]}"
    end
    return output
  end

  # def parameters
  #   parameters = []
  #   5.times do |index|
  #     @recipes.each do |recipe|
  #       parameters << recipe[index]
  #     end
  #   end
  #   return parameters
  # end

  # Min set to 4000 to allow for later implementation of large (4L) batch-brewed coffees
  # def recipe_min
  #   index = 0
  #   min = 4000 
  #   while index < 5
  #     @recipes.each do |value|
  #       if value[index] < min 
  #         min = value[index]
  #       end
  #     end
  #     index += 1
  #   end
  # end

  # def summarise_recipes
  #   range = []
  #   y = 0
  #   while y < 5 do
  #     max = 0
  #     min = 100
  #     kamwangi.recipes.each do |recipe|
  #       if recipe[y] > max 
  #         max = recipe[y]
  #       elsif recipe[y] < min
  #         min = recipe[y]
  #       end
  #     end
  #     range << [min, max]
  #     y += 1
  #   end
  # end

  # def to_json
  #   {
  #     origin: @origin,
  #     name: @name,
  #     highlight: @highlight,
  #     minimise: @minimise,
  #     tactile: @tactile,
  #     recipes: @recipes,
  #   }
  # end

  # def self.to_json
  #   @@coffees.map do |x|
  #     x.to_json
  #   end
  # end
end
