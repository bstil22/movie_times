require 'csv'
require_relative 'calculate_times'

start_time = 675 # 11:15 AM in minutes
end_time = 1380 # 11PM in minutes

weekend_start_time = 645 # 10:45 AM in minutes
weekend_end_time = 1440 # 12PM in minutes

end_buffer_time = 20 # in minutes

csv_text = File.read(File.join(File.dirname(__FILE__), 'movies.csv'))
csv_data = CSV.parse(csv_text)

csv_data.each do |row|
  movie_name = row[0]
  puts "Showtimes for: #{movie_name}"
  puts
  movie_minutes = row[1].gsub(/[^\d]/,"").to_i

  puts "Weekday:"

  CalculateTimes::times(
    end_time: end_time,
    start_time: start_time,
    movie_time: movie_minutes,
    end_buffer_time: end_buffer_time
  )

  puts "Weekend:"

  CalculateTimes::times(
    end_time: weekend_end_time,
    start_time: weekend_start_time,
    movie_time: movie_minutes,
    end_buffer_time: end_buffer_time
  )
end


