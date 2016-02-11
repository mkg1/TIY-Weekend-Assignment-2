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
    assert_equal "Marketing", d.department
  end

  def test_employee_can_be_created
    e = Employee.new("John Smith", "Johnsmith@aol.com", "555-5555", 100000)
    assert e
    assert_equal "John Smith", e.name
    assert_equal "Johnsmith@aol.com", e.email
    assert_equal "555-5555", e.phone
    assert_equal 100000, e.salary
  end

  def test_employee_can_be_added_to_department
    d = Department.new("Marketing")
    e = Employee.new("John Smith", "Johnsmith@aol.com", "555-5555", 100000)
    d.add_employee(e)
    assert_equal e, d.employees[0]
  end

  def test_get_total_department_salaries
    d = Department.new("Marketing")
    e1 = Employee.new("John Doe", "Johnsmith@aol.com", "555-5555", 100000)
    e2 = Employee.new("Joe Smith", "Johnsmith@aol.com", "555-5555", 55000)
    e3 = Employee.new("Jane Smith", "Johnsmith@aol.com", "555-5555", 500000)
    d.add_employee(e1)
    d.add_employee(e2)
    d.add_employee(e3)
    bigmoney = d.get_total_salaries(d)
    assert_equal 655000, bigmoney
  end

  def test_add_employee_review
    e = Employee.new("John Smith", "Johnsmith@aol.com", "555-5555", 100000)
    e.review = "John Smith is lagging behind on work. His sales are down for each quarter and he needs to be fired!"
    assert_equal "John Smith is lagging behind on work. His sales are down for each quarter and he needs to be fired!", e.review
  end
end
