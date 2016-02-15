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
    positives = [/positive/i, /encourag\S+/i, /valu\S+/i, /\bconsistent\S*/i, /\bimpress\S*/i, /\beffectiv(\b|\S*)/i, /asset/i, /willing\S*/i, /\bsuccess(\b|\S*)/i, /\brespons\S*/i, /pleasure/i, /willing/i, /\bsatisf\S+/i, /\bproductiv\S+/i, /perfect/i]
    negatives = [/negativ\S+/i, /not done/i, /difficult/i, /room (for|to)/i, /\bconfus\S+/i, /fals\S+/i, /less.+than.+expected/i, /longer.+than.+expected/i, /\bconsequen\S+/i, /inadequate\S*/i, /\bconcern\S*/i, /s?lack.*/i, /\blimit[^l]\S*/i, /\S+rupt\S*/i, /(not |in)consistent\S*/i, /disagree\S*/i]
    positive_reviews = positives.count{ |s| /\b#{s}\b/ =~ @review }
    negative_reviews = negatives.count{ |s| /\b#{s}\b/ =~ @review }
    positive_percentage_score = ((positive_reviews.to_f/(positive_reviews+negative_reviews))*100).round
    if positive_percentage_score >= 75
      @performance = "Satisfactory"
    elsif positive_percentage_score >= 50
      @performance = "Good"
    elsif positive_percentage_score < 50
      @performance = "Unsatisfactory"
    end
  end
end
