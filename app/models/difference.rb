class Difference
  attr_reader :user_stats, :friend_stats

  def initialize(user_stats, friend_stats)
    @user_stats = user_stats
    @friend_stats = friend_stats
  end

  def miles
    user_stats.total_distance - friend_stats.total_distance
  end

  def pace
    user_stats.average_pace - friend_stats.average_pace
  end

  def longest_run
    user_stats.longest_run - friend_stats.longest_run
  end
end
