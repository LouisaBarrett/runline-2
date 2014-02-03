class CompareController < ApplicationController

  def show
    @friend = find_current_friend(params[:id])
    unless current_user.runs.empty? || @friend.runs.empty?
      @my_runs = current_user.runs
      @friend_runs = @friend.runs
      @diff_miles = (current_user.total_distance_in_miles - @friend.total_distance_in_miles).round(2)
      @diff_pace = (current_user.pace - @friend.pace)
      @diff_longest_run = (current_user.longest_run.miles - @friend.longest_run.miles).round(2)

      @user_total_distance = current_user_total_distance
      @user_longest_run = current_user_longest_run
      @user_average_pace = current_user_average_pace

    end
  end

  def find_current_friend(id)
    current_friend = []
    current_user.total_approved_friends.each do |friend|
      if friend.id == id.to_i
        current_friend << friend
      end
      current_friend
    end
    current_friend.first
  end

  private

  def current_user_total_distance
    meters = Calculator.new(current_user.runs).total_distance
    miles = DistanceConverter.new(meters).miles
    Formatter.new.format_for_miles(miles)
  end

  def current_user_longest_run
    meters = Calculator.new(current_user.runs).longest_run
    miles = DistanceConverter.new(meters).miles
    Formatter.new.format_for_miles(miles)
  end

  def current_user_average_pace
    seconds = Calculator.new(current_user.runs).total_average_pace_per_mile
    Formatter.new.format_for_seconds(seconds)
  end
end
