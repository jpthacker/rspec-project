# Task Identifier Recipe

## 1. The Problem

> As a user  
> So that I can keep track of my tasks  
> I want to check if a text includes the string `#TODO`.

## 2. The Method Signature

```ruby

# `identify_task` checks if a string includes the substring `#TODO`. 
task_message = identify_task(text)

text: a string (e.g. "To do: make a list.")
uppercase_words: a confirmation message (e.g. "This text contains an outstanding task.")

# The method doesn't print anything or have any other side-effects
```

## 3. Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

extract_uppercase("hello WORLD") => ["WORLD"]
extract_uppercase("HELLO WORLD") => ["HELLO", "WORLD"]
extract_uppercase("hello world") => []
extract_uppercase("hello WoRLD") => []
extract_uppercase("hello WORLD!") => ["WORLD"]
extract_uppercase("") => []
extract_uppercase(nil) throws an error
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._