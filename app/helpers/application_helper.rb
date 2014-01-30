module ApplicationHelper

  class Formatting
    def self.format_pace(seconds)
      hours = seconds/3600.to_i
      minutes = (seconds/60 - hours *  60).to_i
      seconds_remaining = (seconds - (minutes * 60 + hours * 3600))
      if hours >= 1
        "%01d:%02d:%02d" % [hours, minutes, seconds_remaining]
      elsif minutes <= 9
        "%01d:%02d" % [minutes, seconds_remaining]
      else
        "%02d:%02d" % [minutes, seconds_remaining]
      end
    end
  end

end
