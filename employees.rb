class Employee
  attr_reader :name, :email, :phone, :salary
  attr_accessor :review
  def initialize(name, email, phone, salary, review = nil)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = review
    @performance = false
  end

  def performance_review(critique)
    if critique = "good"
      @performance = true
    end
  end
end
