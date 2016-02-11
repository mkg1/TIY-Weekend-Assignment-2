class Employee
  attr_reader :name, :email, :phone, :salary, :performance
  attr_accessor :review
  def initialize(name, email, phone, salary, review = nil, performance = nil)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = review
    @performance = performance
  end

  def set_performance(critique)
    if critique == true
      @performance = "Satisfactory"
    else
      @performance = "Unsatisfactory"
    end
  end
end
