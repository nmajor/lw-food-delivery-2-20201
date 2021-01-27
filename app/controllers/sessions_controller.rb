require_relative '../views/sessions_view.rb'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new 
  end

  def sign_in
    # ask for the username and password
    username = @sessions_view.ask_for_username
    password = @sessions_view.ask_for_password

    # find the matching employee based on the username
    employee = @employee_repository.find_by_username(username)

    # Check if the passwords match
    if employee && employee.password == password
      @sessions_view.sign_in_successfully(employee)
      employee
    else # if they dont match then ask again
      @sessions_view.sign_in_failed
      sign_in # recursion (calling a method recursively)
    end
  end
end