require 'minitest/autorun'
require 'minitest/pride'

require './department.rb'

class EmployeeReviewsTest < Minitest::Test
  def test_classes_exist
    assert Employee
    assert Department
  end

  def test_department_can_be_created
    d = Department.new("Marketing")
    assert d
    assert_equal "Marketing", d.dept_name
  end

  def test_employee_can_be_created
    e = Employee.new(first_name: "John", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 100000)
    assert e
    assert_equal "John Smith", e.name
    assert_equal "Johnsmith@aol.com", e.email
    assert_equal "555-5555", e.phone
    assert_equal 100000, e.starting_salary
  end

  def test_employee_can_be_added_to_department
    d = Department.new("Marketing")
    e = Employee.new(first_name: "John", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 100000)
    d.add_employee(e)
    assert_equal e, d.employees[0]
  end

  def test_get_total_department_salaries
    d = Department.new("Marketing")
    e1 = Employee.new(first_name: "John", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 100000)
    e2 = Employee.new(first_name: "Joe", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 55000)
    e3 = Employee.new(first_name: "Jane", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 500000)
    d.add_employee(e1)
    d.add_employee(e2)
    d.add_employee(e3)
    bigmoney = d.get_total_salaries(d)
    assert_equal 655000, bigmoney
  end

  def test_add_employee_review
    e = Employee.new(first_name: "John", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 100000)
    e.review = "John Smith is lagging behind on work. His sales are down for each quarter and he needs to be fired!"
    assert_equal "John Smith is lagging behind on work. His sales are down for each quarter and he needs to be fired!", e.review
  end

  def test_set_employee_performance
    e = Employee.new(first_name: "John", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 100000)
    e.set_performance(false)
    assert_equal "Unsatisfactory", e.performance
  end

  def test_give_employee_raise
    e = Employee.new(first_name: "John", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 100000)
    assert_equal 100300, e.give_raise(300)
  end

  def test_give_department_raise
    d = Department.new("Marketing")
    e1 = Employee.new(first_name: "John", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 100000)
    e2 = Employee.new(first_name: "Joe", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 55000)
    e3 = Employee.new(first_name: "Jane", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 500000)
    d.add_employee(e1)
    d.add_employee(e2)
    d.add_employee(e3)
    e1.set_performance(true)
    e2.set_performance(true)
    e3.set_performance(true)
    d.give_department_raise(50000)
    assert_equal 71666, e2.starting_salary
  end

  def test_block_form
    d = Department.new("Marketing")
    e1 = Employee.new(first_name: "John", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 100000)
    e2 = Employee.new(first_name: "Joe", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 55000)
    e3 = Employee.new(first_name: "Jane", last_name: "Smith", email: "Johnsmith@aol.com", phone: "555-5555", starting_salary: 500000)
    d.add_employee(e1)
    d.add_employee(e2)
    d.add_employee(e3)
    e1.set_performance(true)
    e2.set_performance(true)
    e3.set_performance(true)
    d.give_department_raise(50000) {|e| e.performance == "Satisfactory" && e.starting_salary < 56000}
    assert_equal 105000, e2.starting_salary
  end
end
