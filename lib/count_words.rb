# Design

# A method called count_words that takes a string as an argument and returns the number of words in that string.

def count_words(str)
    if (!str.is_a?(String))
        fail "Error: argument must be a string"
    end
    str.split(" ").size
end