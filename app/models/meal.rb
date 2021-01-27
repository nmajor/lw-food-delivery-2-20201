class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def to_csv_array
    [@id, @name, @price] 
  end

  def self.csv_header
    ["id", "name", "price"]
  end
end
