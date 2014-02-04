class Run < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :distance, presence: true
  validates :run_time, presence: true
  validates :workout_datetime, presence: true

  def miles
    self.distance / 1609.34
  end

  def format_date
    ApplicationHelper::Formatting.format_for_date(self.workout_datetime)
  end

  def time_in_minutes
    ApplicationHelper::Formatting.format_for_seconds(self.run_time)
  end

  def mile_pace_in_minutes
    ApplicationHelper::Formatting.format_for_seconds((self.run_time / self.miles))
  end

end
