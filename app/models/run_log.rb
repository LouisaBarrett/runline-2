class RunLog

  attr_reader :run

  def initialize(run)
    @run = run
  end

  def name
    run.name
  end

  def distance
    format(run.distance)
  end

  def run_time
    Formatter.new.format_for_seconds(run.run_time)
  end

  def run_date
    # date = Time.parse(run.workout_datetime)
    # date.strftime("%a, %m/%d/%y")
    Formatter.new.format_for_date(run.workout_datetime)
  end

  private

  def format(meters)
    miles = DistanceConverter.new(meters).miles
    Formatter.new.format_for_miles(miles)
  end



end
