class Employee
  attr_reader :name, :email, :phone, :performance
  attr_accessor :review, :starting_salary
  def initialize(first_name:, last_name:, email:, phone:, starting_salary:, review: nil, performance: nil)
    @name = "#{first_name} #{last_name}"
    @email = email
    @phone = phone
    @starting_salary = starting_salary
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

  def give_raise(raise_amount)
    @starting_salary += raise_amount
  end
end
