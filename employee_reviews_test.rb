require 'minitest/autorun'
require 'minitest/pride'

require './employees.rb'

class EmployeeReviewsTest < Minitest::Test
  def test_classes_exist
    assert Employee
    assert Department
  end

  def test_department_can_be_created
    d = Department.new("Marketing")
    assert d
  end
end
