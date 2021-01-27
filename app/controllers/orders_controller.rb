require_relative '../views/orders_view.rb'

class OrdersController
  def initialize(order_repository, meals_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meals_repository = meals_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders_view = OrdersView.new
  end

  def add
    # ! Not finished yet
    meals = @meals_repository.all
    @orders_view.print_meals(meals)
    meal_id = @orders_view.ask_user_for_id
    meal = @meals_repository.find(meal_id)

    customers = @customer_repository.all
    @orders_view.print_customers(customers)
    customer_id = @orders_view.ask_user_for_id
    customer = @customer_repository.find(customer_id)

    employees = @employee_repository.all
    @orders_view.print_employees(employees)
    employee_id = @orders_view.ask_user_for_id
    employee = @employee_repository.find(employee_id)

    @order_repository.add(Order.new({ meal: meal, employee: employee, customer: customer }))
  end
end