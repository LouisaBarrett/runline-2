require 'delegate'

class LoggedRun < SimpleDelegator

  def miles
    DistanceConverter.new(distance).miles
  end

  def stopwatch
    Formatter.new.format_for_seconds(run_time)
  end

  def date
    Formatter.new.format_for_date(workout_datetime)
  end

  def pace
    Formatter.new.format_for_seconds(run_time / miles)
  end
end
