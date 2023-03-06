# {{PROBLEM}} Method Design Recipe

Copy this into a `recipe.md` in your project and fill it out.

## 1. Describe the Problem

> As a user  
> So that I can manage my time  
> I want to see an estimate of reading time for a text, assuming that I can read
> 200 words a minute.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby

# `reading_time` calculates the time it takes to read a text of a specific length
reading_time = estimate_reading_time(length_of_text)

length_of_text: an integer (e.g. 10000)
reading_time: a string (e.g. "This text will take an estimated 54 mins to read")

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

extract_uppercase(200) => "This text will take an estimated 1 minute to read"
estimate_reading_time(10000) => "This text will take an estimated 50 minutes to read"
estimate_reading_time(20000) => "This text will take an estimated 100 minutes to read"
estimate_reading_time(314565) => "This text will take an estimated 1572 minutes to read"
estimate_reading_time() => ""
estimate_reading_time() throws an error "Error: please enter the length of a text as an integer"
estimate_reading_time(nil) throws an error "Error: please enter the length of a text as an integer"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._