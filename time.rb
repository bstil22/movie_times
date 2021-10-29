module TimeHelpers
  extend self
  def minutes_to_time(min)
    hours, minutes = min.divmod(60)
    "#{format_hours(hours)}:#{format_minutes(minutes)} #{am_or_pm(hours)}"
  end

  def round_up(n, increment)
    increment * (( n + increment - 1) / increment)
  end

  def down_to_nearest_five(n)
    return n if n % 5 == 0
    rounded = n.round(-1)
    rounded < n ? rounded : rounded - 5
  end

  def format_hours(hours)
    if hours > 12
      return hours - 12
    end
    hours
  end

  def format_minutes(minutes)
    if minutes < 10
      return "0#{minutes}"
    end
    minutes
  end

  def am_or_pm(hours)
    hours < 12 ? "AM" : "PM"
  end
end
