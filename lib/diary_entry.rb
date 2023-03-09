class DiaryEntry
    def initialize(title, contents)
        @title = title
        @contents = contents
    end

    def title
        @title
    end

    def contents
        @contents
    end

    def count_words
        @contents.split(" ").size
    end

    def reading_time(wpm)
        return 0 if !@contents.length == 0
        (@contents.split(" ").length.to_f / wpm).ceil
    end

    def words_read
        @words_read
    end

    def reading_chunk(wpm, minutes)
        no_of_words = wpm * minutes
        words = @contents.split(" ")
        if !@words_read || @words_read == @contents || wpm >= @contents.length
            @words_read = words.slice(0, no_of_words).join(" ")
            return @words_read
        end
        words_to_add = words[@words_read.split(" ").length, no_of_words].join(" ")
        @words_read << " " + words_to_add
        words_to_add
    end
end
