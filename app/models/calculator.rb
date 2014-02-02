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

  def total_average_pace_per_mile
    total_distance = DistanceConverter.new(self.total_distance).miles
    total_seconds / total_distance
  end

  private

  def total_seconds
    user.runs.collect(&:run_time).reduce(0, :+).to_f
  end
end
