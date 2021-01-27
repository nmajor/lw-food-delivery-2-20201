class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def to_csv_array
    [@id, @name, @address] 
  end

  def self.csv_header
    ["id", "name", "address"]
  end
end
