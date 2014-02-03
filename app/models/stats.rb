class Stats
  attr_reader :runs

  def initialize(runs)
    @runs = runs
  end

  def total_distance
    format(calc.total_distance)
  end

  def longest_run
    format(calc.longest_run)
  end

  def average_pace
    seconds = calc.total_average_pace_per_mile
    Formatter.new.format_for_seconds(seconds)
  end

  private

  def calc
    @calc ||= Calculator.new(runs)
  end

  def format(meters)
    miles = DistanceConverter.new(meters).miles
    Formatter.new.format_for_miles(miles)
  end
end
