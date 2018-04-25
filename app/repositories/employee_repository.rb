require_relative "../models/employee"
require_relative "base_repository"

class EmployeeRepository < BaseRepository

  def find_by_username(username)
    @elements.find { |employee| employee.username == username }
  end

  def build_element(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end

end
