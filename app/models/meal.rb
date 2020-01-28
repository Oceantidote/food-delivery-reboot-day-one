class Meal
  attr_accessor :id
  attr_reader :name, :price
  def initialize(whatever = {})
    @name = whatever[:name]
    @price = whatever[:price]
    @id = whatever[:id]
  end
end

