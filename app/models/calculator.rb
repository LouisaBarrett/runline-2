class Calculator
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def total_distance
    user.runs.collect(&:distance).reduce(0, :+)
  end
end
