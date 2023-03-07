## 1. Describe the Problem

> As a user  
> So that I can improve my grammar  
> I want to verify that a text starts with a capital letter and ends with a
> suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby

# `check_grammer` assesses the grammar of astring and returns a message
grammar_message = check_grammar(string)

length_of_text: an integer (e.g. "Hello world!")
grammar_message: a string (e.g. "Your grammar is good.")

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

check_grammar("Hello world!") = "Your grammar is good."
check_grammar("hello world") = "That's not quite right. Correct your text and try again."
estimate_reading_time() => "Error: please enter a valid string"
estimate_reading_time() throws an error "Error: please enter a valid string"
estimate_reading_time(nil) throws an error "Error: please enter a valid string"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._