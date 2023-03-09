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
    str = ""
    @diary_entries.each do |entry|
      words = entry.contents.split(" ").size
      if words > str.split(" ").size && words <= target_words
        str = entry.contents
      end
    end
    i = 0
    while i < @diary_entries.size do
    if @diary_entries[i].contents == str
        return @diary_entries[i]
    end
      i += 1
    end
  end
end