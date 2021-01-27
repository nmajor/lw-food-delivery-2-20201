require_relative 'base_repository'
require_relative "../models/order"

class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    super(csv_file)
  end

  def build_element(row)
    # row = {id: 1, delivered: "false", meal_id: "1", employee_id: "1", customer_id: "1"}
    row[:id] = row[:id].to_i
    row[:delivered] = (row[:delivered] == "true")

    order = Order.new(row)
    
    # Follow your data

    meal = @meal_repository.find(row[:meal_id].to_i)
    customer = @customer_repository.find(row[:customer_id].to_i)
    employee = @employee_repository.find(row[:employee_id].to_i)

    order.meal = meal
    order.customer = customer
    order.employee = employee

    order
  end
end
