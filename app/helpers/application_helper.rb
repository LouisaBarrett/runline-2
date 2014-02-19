module ApplicationHelper

  def total_distance_in_miles_for(stats)
    stats.total_distance.round(2)
  end

  def longest_run_in_miles_for(stats)
    stats.longest_run.round(2)
  end

  def average_pace_formatted_for(stats)
    Formatter.new.format_for_seconds(stats.average_pace)
  end

  def compared_miles_for(diff)
    diff.miles.round(2)
  end

  def compared_longest_run_for(diff)
    diff.longest_run.round(2)
  end

  def compared_pace_for(diff)
    Formatter.new.format_for_seconds(diff.pace.abs)
  end

end
