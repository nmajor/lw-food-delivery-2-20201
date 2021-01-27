class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    while @running
      # Ask the user to sign in
      @employee = @sessions_controller.sign_in

      while @employee
        if @employee.manager?
          print_manager_menu
          choice = gets.chomp.to_i
          print `clear`
          route_manager_action(choice)
        else
          print_delivery_guy_menu
          choice = gets.chomp.to_i
          print `clear`
          route_delivery_guy_action(choice)
        end
      end
    end
  end

  private

  def print_delivery_guy_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. List all meals"
    puts "2. List all customers"
    puts "3. Add an order"
    puts "8. Sign Out"
    puts "9. Exit"
    print "> "
  end

  def print_manager_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "8. Sign Out"
    puts "9. Exit"
    print "> "
  end

  def route_delivery_guy_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @customers_controller.list
    when 3 then @orders_controller.add
    when 8 then @employee = nil
    when 9 then stop!
    else puts "Try again..."
    end
  end

  def route_manager_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 8 then @employee = nil
    when 9 then stop!
    else puts "Try again..."
    end
  end

  def stop!
    @employee = nil
    @running = false
  end
end
