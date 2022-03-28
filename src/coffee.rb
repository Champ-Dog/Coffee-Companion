
class Coffee
    attr_accessor :origin, :name, :cupping

    def initialize(origin, name)
        @origin = origin.capitalize
        @name = name.capitalize
    end
end