require './employees.rb'
class Department
  attr_reader :department, :employees
  def initialize(department)
    @department = department
    @employees = []
  end

  def add_employee(new_employee)
    @employees << new_employee
  end
end
