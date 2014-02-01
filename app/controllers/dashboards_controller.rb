class DashboardsController < ApplicationController

  def show
    if current_user.runs.empty?
      redirect_to no_runs_path
    else
      @my_runs = current_user.runs
      @user_distance = current_user_total_distance
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
end
