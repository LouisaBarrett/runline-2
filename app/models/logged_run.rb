require "delegate"

class LoggedRun < SimpleDelegator

  def miles
    DistanceConverter.new(distance).miles.round(2)
  end

  def seconds
    Formatter.new.format_for_seconds(run_time)
  end

  def date
    Formatter.new.format_for_date(workout_datetime)
  end
end
