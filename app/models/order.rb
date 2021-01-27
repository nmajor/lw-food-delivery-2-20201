class Order
  attr_accessor :id, :meal, :customer, :employee

  def initialize(attributes = {})
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
    @id = attributes[:id]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end