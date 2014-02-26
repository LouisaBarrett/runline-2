class FetchRunsWorker
  @queue = :fetch

  def self.perform
    Authentication.where("token IS NOT NULL AND uid IS NOT NULL").each do |auth|
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
end
