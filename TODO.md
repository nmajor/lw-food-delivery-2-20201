- Try out the app a bit
- Add Employee Model and Repository
  - Employee
    - id
    - username
    - password
    - role # ["manager", "delivery_guy"]
- Add employees to the employee.csv
- Test out the Employee model and repo
- Create SessionsController
  - def init(employee_repository)
  - def sign_in
  - `@view.ask_user_for_username`
  - `@view.ask_user_for_password`
  - find_employee with username
  - If employee found and passwords match
    - then `@view.sign_in_success` and return employee
    - else `@view.wrong_credentials` and recursively call sign_in
- Add `employee = @sessions_controller.sign_in` before the router loop
- Router
  - Make these methods:
    - `print_delivery_guy_menu`
    - `print_manager_menu`
    - `route_deliver_guy_action(action)`
    - `route_manager_action(action)`
  - Add logic to loop to display different menu and route different actions depending on the employee role

Sign Out logic
- Store employee in instance variable
- convert loop to while `@employee`
- Add another loop around the @employee assignment and existing loop
- Add a @running instance variable
- signout route: `when 8 then @employee = nil`
- add quite route: `when 0 then ; @running = false ; @employee = nil` 

print `clear` # clears the screen
