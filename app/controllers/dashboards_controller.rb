class DashboardsController < ApplicationController

  def show
    if current_user.runs.empty?
      redirect_to no_runs_path
    else
      @my_runs = current_user.runs
      @user_total_distance = current_user_total_distance
      @user_longest_run = current_user_longest_run
      @user_average_pace = current_user_average_pace
    end
  end

  def no_runs

  end

  def fetch_runs
    current_user.fetch_runs
    redirect_to dashboard_path
  end

  private

  def current_user_total_distance
    meters = Calculator.new(current_user).total_distance
    miles = DistanceConverter.new(meters).miles
    Formatter.new.format_for_miles(miles)
  end

  def current_user_longest_run
    meters = Calculator.new(current_user).longest_run
    miles = DistanceConverter.new(meters).miles
    Formatter.new.format_for_miles(miles)
  end

  def current_user_average_pace
    seconds = Calculator.new(current_user).total_average_pace_per_mile
    Formatter.new.format_for_seconds(seconds)
  end
end
