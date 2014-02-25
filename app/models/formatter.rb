class Formatter
  def format_for_seconds(seconds)
    hours = (seconds/3600).to_i
    minutes = ((seconds/60) - (hours *  60)).to_i
    seconds_remaining = (seconds - (minutes * 60 + hours * 3600))
    if hours >= 1
      "%01d:%02d:%02d" % [hours, minutes, seconds_remaining]
    elsif minutes == 0
      "%02d:%02d" % [minutes, seconds_remaining]
    elsif minutes <= 9
      "%01d:%02d" % [minutes, seconds_remaining]
    else
      "%02d:%02d" % [minutes, seconds_remaining]
    end
  end

  def format_for_date(input_date)
    date = Time.parse(input_date)
    date.strftime("%a, %m/%d/%y")
  end
end
