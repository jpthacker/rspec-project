def identify_task(str)
    fail "Error: please enter a valid string" if str.to_s.empty?
    str.include?("#TODO")
end