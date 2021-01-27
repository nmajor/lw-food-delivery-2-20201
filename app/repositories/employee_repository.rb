require_relative 'base_repository'
require_relative '../models/employee'

class EmployeeRepository < BaseRepository
  def build_element(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end

  def find_by_username(username)
    @elements.find do |element|
      if element.username == username
        true
      else
        false
      end
    end
  end
end
