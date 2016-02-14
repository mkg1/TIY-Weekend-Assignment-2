class Employee
  attr_reader :name, :email, :phone
  attr_accessor :review, :starting_salary, :performance
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

  def employee_review_status(review)
    @review = review
    positives = [/positive/i, /encourag\S+/i, /valuable/i, /\bconsistent\S*/i, /\bimpress\S*/i, /\beffectiv(\b|\S*)/i, /asset/i, /willing\S*/i, /\bsuccess(\b|\S*)/i, /\brespons\S*/i]
    negatives = [/negative/i, /difficult/i, /improvement/i, /\bconfus\S+/i, /\bconsequen\S+/i, /inadequate\S*/i, /\bconcern\S+/i, /\S+rupt\S*/i, /(not |in)consistent\S*/i, ]
    positive_reviews = positives.count{ |s| /\b#{s}\b/ =~ @review }
    puts positive_reviews
    negative_reviews = negatives.count{ |s| /\b#{s}\b/ =~ @review }
    puts negative_reviews
    if negative_reviews < positive_reviews
      @performance = "Satisfactory"
    elsif positive_reviews < negative_reviews
      @performance = "Unsatisfactory"
    end
  end
end
