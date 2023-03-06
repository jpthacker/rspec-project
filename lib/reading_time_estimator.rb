def reading_time_estimator(word_count)
    if !word_count.is_a?(Integer)
        fail "Error: word count must be an integer"
    end
    words_per_minute = 200
    reading_time = (word_count.to_f / words_per_minute.to_f).ceil
    minute_str = reading_time == 1 ? "minute" : "minutes"
    "This text will take #{reading_time} #{minute_str} to read"
end