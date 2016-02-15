require 'minitest/autorun'
require 'minitest/pride'

require './department.rb'

class EmployeeReviewsTest < Minitest::Test
  private def zeke_review
    "Zeke is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Zeke has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion.
    Second, when discussing new requirements with project managers, less of the information is retained by Zeke long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further."
  end

  private def yvonne_review
    "Thus far, there have been two concerns over Yvonne's performance, and both have been discussed with her in internal meetings.  First, in some cases, Yvonne takes longer to complete tasks than would normally be expected.  This most commonly manifests during development on existing applications, but can sometimes occur during development on new projects, often during tasks shared with Andrew.  In order to accommodate for these preferences, Yvonne has been putting more time into fewer projects, which has gone well.
    Second, while in conversation, Yvonne has a tendency to interrupt, talk over others, and increase her volume when in disagreement.  In client meetings, she also can dwell on potential issues even if the client or other attendees have clearly ruled the issue out, and can sometimes get off topic."
  end

  private def xavier_review
    "Xavier is a huge asset to SciMed and is a pleasure to work with.  He quickly knocks out tasks assigned to him, implements code that rarely needs to be revisited, and is always willing to help others despite his heavy workload.  When Xavier leaves on vacation, everyone wishes he didn't have to go.
    Last year, the only concerns with Xavier's performance were around ownership.  In the past twelve months, he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts with estimates on Acme, clients are happy with his work and responsiveness, which is everything that his managers could ask for."
  end

  private def wanda_review
    "Wanda has been an incredibly consistent and effective developer.  Clients are always satisfied with her work, developers are impressed with her productivity, and she's more than willing to help others even when she has a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys working with her.  During the past year, she has largely been devoted to work with the Cement Company, and she is the perfect woman for the job.  We know that work on a single project can become monotonous, however, so over the next few months, we hope to spread some of the Cement Company work to others.  This will also allow Wanda to pair more with others and spread her effectiveness to other projects."
  end

  private def test_good_review
    "Molly is positive negative encouraging difficult valuable less than expected asset concerning"
  end

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

  def test_employee_review_positive_vs_negative_counts
    e1 = Employee.new(first_name: "Zeke", last_name: "Smith", email: "zekesmith@aol.com", phone: "555-5555", starting_salary: 100000)
    e2 = Employee.new(first_name: "Yvonne", last_name: "Richards", email: "yr@aol.com", phone: "555-5555", starting_salary: 55000)
    e3 = Employee.new(first_name: "Wanda", last_name: "Sutton", email: "ws@aol.com", phone: "555-5555", starting_salary: 500000)
    e4 = Employee.new(first_name: "Xavier", last_name: "Holt", email: "zh@aol.com", phone: "555-5555", starting_salary: 55000)
    e1.employee_review_status(zeke_review)
    e2.employee_review_status(yvonne_review)
    e3.employee_review_status(wanda_review)
    e4.employee_review_status(xavier_review)
    assert_equal "Unsatisfactory", e1.performance
    assert_equal "Unsatisfactory", e2.performance
    assert_equal "Satisfactory", e3.performance
    assert_equal "Satisfactory", e4.performance
  end

  def test_score_based_department_raise
    d = Department.new("Marketing")
    e1 = Employee.new(first_name: "Zeke", last_name: "Smith", email: "zekesmith@aol.com", phone: "555-5555", starting_salary: 100000)
    e2 = Employee.new(first_name: "Yvonne", last_name: "Richards", email: "yr@aol.com", phone: "555-5555", starting_salary: 55000)
    e3 = Employee.new(first_name: "Wanda", last_name: "Sutton", email: "ws@aol.com", phone: "555-5555", starting_salary: 500000)
    e4 = Employee.new(first_name: "Xavier", last_name: "Holt", email: "zh@aol.com", phone: "555-5555", starting_salary: 55000)
    e5 = Employee.new(first_name: "Molly", last_name: "Gehring", email: "mg@aol.com", phone: "555-5555", starting_salary: 42000)
    e1.employee_review_status(zeke_review)
    e2.employee_review_status(yvonne_review)
    e3.employee_review_status(wanda_review)
    e4.employee_review_status(xavier_review)
    e5.employee_review_status(test_good_review)
    d.add_employee(e1)
    d.add_employee(e2)
    d.add_employee(e3)
    d.add_employee(e4)
    d.add_employee(e5)
    d.give_department_raise(50000) {|e| (e.performance == "Satisfactory" || e.performance =="Good") && e.starting_salary < 56000}
    assert_equal "Unsatisfactory", e1.performance
    assert_equal "Unsatisfactory", e2.performance
    assert_equal "Satisfactory", e3.performance
    assert_equal "Satisfactory", e4.performance
    assert_equal "Good", e5.performance
    assert_equal 80000, e4.starting_salary
    assert_equal 54500, e5.starting_salary
  end
end
