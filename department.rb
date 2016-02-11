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

  def get_total_salaries(department)
    d = department
    salaries = 0
    d.employees.each do |i|
      salaries = salaries + i.salary
    end
    return salaries
  end
end
