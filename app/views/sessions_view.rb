class SessionsView
  def ask_for_username
    puts "Please enter your username:"
    gets.chomp
  end

  def ask_for_password
    puts "Please enter your password:"
    gets.chomp
  end

  def sign_in_successfully(employee)
    puts "Welcome #{employee.username}!"
  end

  def sign_in_failed
    puts "Wrong credentials, try again..."
  end
end