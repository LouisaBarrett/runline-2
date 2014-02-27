class DashboardsController < ApplicationController

  def show
    if current_user.runs.empty?
      redirect_to no_runs_path
    else
      @my_runs = current_user.runs
      @stats = Stats.new(current_user.runs)
    end
  end

  def no_runs

  end

  def fetch_runs
    recent_runs
    redirect_to dashboard_path
  end

  private

  def recent_runs
    user_auth = Authentication.where(:user_id => current_user.id, :provider => "mapmyfitness")
    auth = user_auth.first
    store = MapMyFitness::WorkoutStore.new(auth.token)
    runs = store.workouts_by_user_in_last_days(auth.uid, 30)
    runs.each do |run|
      Run.where(:mmf_identifier => run.id).first_or_create(
        user_id: Authentication.find_by_uid(auth.uid).user_id,
        name: run.name,
        distance: run.distance,
        run_time: run.duration,
        workout_datetime: run.started_at
      )
    end
  end

end
