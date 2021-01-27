class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role] # manager / delivery_guy
  end

  def manager?
    @role == "manager"
  end

  def to_csv_array
    [@id, @username, @password, @role] 
  end

  def self.csv_header
    ["id", "username", "password", "role"]
  end
end