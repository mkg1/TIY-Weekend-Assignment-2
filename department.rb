require 'byebug'
require './employees.rb'
class Department
  attr_reader :dept_name, :employees
  def initialize(dept_name)
    @dept_name = dept_name
    @employees = []
  end

  def add_employee(new_employee)
    @employees << new_employee
  end

  def get_total_salaries(dept_name)
    salaries = 0
    dept_name.employees.each do |i|
      salaries = salaries + i.starting_salary
    end
    return salaries
  end

  def give_department_raise(dept_raise)
    up_for_raise = []
    employees.each do |p|
      if p.performance == "Satisfactory"
        up_for_raise << p
      end
    end
    length = up_for_raise.length
    up_for_raise.each do |x|
      x.starting_salary += (dept_raise / length)
    end
  end
end


# employees.each do |i|
#   array << i.performance
#   # if i.performance == "Satisfactory"
#   #   i.starting_salary += amount/length
#   #   return
#   # end
# end
# puts array
#
# exemplary = employees.select {|i| i.performance == "Satisfactory"}
# length = exemplary.length
# exemplary.each do |x|
#   print exemplary[x].starting_salary
# end
# puts exemplary[0].starting_salary
# puts exemplary[1].starting_salary
