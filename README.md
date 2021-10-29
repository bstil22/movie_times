# movie_times

to run: ```ruby ./movie_times.rb```

to edit input: edit ```movies.csv``` csv is formatted like so: ```name, minutes```

I ended up representing time in minutes here. There are certainly things to clean up but I am pretty stoked about how easy the code is to read, given that the problem itself is somewhat complex. I think dealing with time objects is much less readable, and this has the ability one day to simply deal with minutes and be language and timezone agnostic (could return utc times for example).
