require_relative 'app/repositories/employee_repository'
require_relative 'app/models/employee'

EMPLOYEE_CSV_FILE = File.join(__dir__, "data/employees.csv")

repository = EmployeeRepository.new(EMPLOYEE_CSV_FILE)

p repository
