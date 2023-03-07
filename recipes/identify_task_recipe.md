# Task Identifier Recipe

## 1. The Problem

> As a user  
> So that I can keep track of my tasks  
> I want to check if a text includes the string `#TODO`.

## 2. The Method Signature

```ruby

# `identify_task` checks if a string includes the substring `#TODO`.
boolean_value = identify_task(text)

text: a string (e.g. "#TODO: make a list.")
boolean_value: e.g. true

# The method doesn't print anything or have any other side-effects
```

## 3. Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

identify_task("") => "Error: please enter a valid string"
identify_task(nil) => "Error: please enter a valid string"
identify_task("#TODO: clean bathroom") => true
identify_task("Hoover house") => false
identify_task("#TODO: clean bathroom; #TODO: clean kitchen") => true
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._