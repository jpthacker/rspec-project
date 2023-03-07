def check_grammar(str)
    fail "Error: please enter a valid string" if !str.is_a?(String) || !str[0]
    str[0].match?(/[A-Z]/) && str[-1].match?(/[.?!]/) ? "Your grammar is good." : "That's not quite right. Correct your text and try again."
end