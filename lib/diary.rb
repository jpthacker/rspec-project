class Diary
  def initialize
    @diary_entries = []
  end

  def add(entry)
    @diary_entries << entry
  end

  def all
    @diary_entries
  end

  def count_words
    word_count = 0
    @diary_entries.each {|entry| word_count += entry.count_words}
    word_count
  end

  def reading_time(wpm)
    entire_reading_time = 0
    @diary_entries.each {|entry| entire_reading_time += entry.reading_time(wpm)}
    entire_reading_time
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    target_words = wpm * minutes
    # chunks = []
    str = ""
    @diary_entries.each do |entry|
      # chunks << entry.contents
      if entry.contents.split(" ").size > str.length && entry.contents.split(" ").length <= target_words
        str = entry.contents
      end
    end
    return str

    # i = 0
    # while i < @diary_entries.size do
    #   str = chunks[i]
    #   result = str <=> target_words
    # if result == 0
    #    return @diary_entries[i]
    # end
    #   i += 1
    # end



    # return chunks
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end