class Calculator
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def total_distance
    user.runs.collect(&:distance).reduce(0, :+)
  end

  def longest_run 
    longest_run = user.runs.max_by { |run| run.distance }
    longest_run.distance
  end
end
