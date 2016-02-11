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
    assert_equal e, employees[0]
  end
end
