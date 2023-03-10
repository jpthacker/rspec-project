# Design

# A method called count_words that takes a string as an argument and returns the number of words in that string.

def make_snippet(string)
    if (!string.is_a?(String))
        fail "Error: argument must be a string"
    end
    words = string.split(" ")
    words.length > 5 ? "#{words[0..4].join(" ")}..." : string
end