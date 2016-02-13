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

  def employee_review_status
    @review = "Zeke is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Zeke has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion."
  #  @reviews.select {|n| (n.match(/\b#{name}\b/i)) ? (n = name.review) : false}
    positives = [/positive/, /encourages/]
    negatives = [/difficult/, /confusion/, /technically/, /improvement/]
    positive_reviews = positives.count{ |s| /\b#{s}\b/ =~ @review }
    negative_reviews = negatives.count{ |s| /\b#{s}\b/ =~ @review }
    if negative_reviews < positive_reviews
      @performance = "Satisfactory"
    elsif positive_reviews < negative_reviews
      @performance = "Unsatisfactory"
    end
  end
end
