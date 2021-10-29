require_relative 'time'

module CalculateTimes
  extend self
  def times(end_time:, start_time:, movie_time:, end_buffer_time:, preview_time:)
    total_avail_screentime = end_time - start_time
    time_of_each_show = movie_time + end_buffer_time + preview_time

    # this is a bit of a hack, by default returns a rounded down integer e.g. 40 / 12 => 3
    # we dont want to round up as it would put us over time
    number_of_showings = total_avail_screentime / time_of_each_show

    starting_at = TimeHelpers::round_up(start_time, 5)
    showings = []
    Array.new(number_of_showings).each do |_| # hacky way to create an array of length -> number_of_showings
      ends_at = starting_at + movie_time
      showings.push({ start: starting_at, ends: ends_at })
      # ensure next show starts after movie is completed and buffer is added
      time_to_add = starting_at + (movie_time + end_buffer_time + preview_time)
      starting_at = TimeHelpers::round_up(time_to_add, 5)
    end

    # this is odd, but we want to ensure the movie ends as close to closing as possible per spec, so we
    # take the end_time and see how much is left over from the end of the last show
    time_remaining = TimeHelpers::down_to_nearest_five(end_time - showings[-1][:ends])

    # all this is doing is adding the time_remaining to start and end in order to shift times near closing
    showings.each do |obj|
      obj[:ends] = obj[:ends] + time_remaining
      obj[:start] = obj[:start] + time_remaining
    end

    showings.each do |show|
      puts "#{TimeHelpers::minutes_to_time(show[:start])} - #{TimeHelpers::minutes_to_time(show[:ends])}"
    end

    puts #just for formatting purposes
  end
end
