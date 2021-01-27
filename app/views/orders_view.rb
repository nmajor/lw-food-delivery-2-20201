class OrdersView
  def print_meals(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} #{meal.price}"
    end
  end

  def ask_user_for_meal_id
    puts "Which meal?"
    gets.chomp.to_i
  end
end