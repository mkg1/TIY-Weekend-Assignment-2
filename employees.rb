class Employee
  attr_reader :name, :email, :phone, :salary
  attr_accessor :review, :performance
  def initialize(name, email, phone, salary, review = nil, performance = nil)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = review
    @performance = performance
  end

  # def performance_review(critique)
  #   if critique = "good"
  #     @performance = true
  #   end
  # end
end
