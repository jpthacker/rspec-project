# Multi-Class Organiser Design Recipe

## 1. The Problem

> As a user  
> So that I can record my experiences  
> I want to keep a regular diary

> As a user  
> So that I can reflect on my experiences  
> I want to read my past diary entries 

> As a user  
> So that I can reflect on my experiences in my busy day  
> I want to select diary entries to read based on how much time I have and my
> reading speed

> As a user  
> So that I can keep track of my tasks  
> I want to keep a todo list along with my diary

> As a user  
> So that I can keep track of my contacts  
> I want to see a list of all of the mobile phone numbers in all my diary
> entries

## 2. The Class System

```ruby
class Organiser
  def initialize(diary, todo_list) # diary and todo_list are instances of Diary and TodoList, respectively
    @diary # => A list of instances of diary entries added to the organiser
    @todo_list # => A list of instances tasks added to the organiser
  end
  attr_accessor :diary, :todo_list

    def contacts
        # Returns a list of mobile numbers contained within @diary
    end
end

class Diary
  def initialize
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Adds diary entry to @diary 
    # Returns nothing
  end

  def all
    # Returns a list of instances of DiaryEntry
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end

class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    # ...
  end

  def title
    # Returns the title as a string
  end

  def contents
    # Returns the contents as a string
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the
                        # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end

class TodoList
  def initialize
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
  end

  def incomplete
    # Returns all non-done todos
  end

  def complete
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
  end
end

class Todo
  def initialize(task) # task is a string
    # ...
  end

  def task
    # Returns the task as a string
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
  end
end
```

## 3. Examples as Integration Tests

```ruby

# Organiser

# 1. Returns all diary entries in the user's diary
diary = Diary.new
todo_list = TodoList.new
organiser = Organiser.new(diary, todo_list)
entry_1 = DiaryEntry.new("09.03.23", "It snowed.")
entry_2 = DiaryEntry.new("10.03.23", "It snowed again. Then it thawed.")
working_diary = organiser.diary
diary.add(entry_1)
diary.add(entry_2)
diary.all # => [entry_1, entry_2]
organiser.diary = working_diary
organiser.diary # => working_diary

# 2. Returns the best entry based on the user's reading time
       diary = Diary.new
todo_list = TodoList.new
organiser = Organiser.new(diary, todo_list)
entry_1 = DiaryEntry.new("entry_1", "this happened today")
entry_2 = DiaryEntry.new("entry_2", "this happened yesterday. It was my birthday!")
entry_3 = DiaryEntry.new("entry_3", "this happened the day before yesterday.")
working_diary = organiser.diary
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.find_best_entry_for_reading_time(2, 3) # => entry_3
organiser.diary = working_diary
organiser.get_diary # => working_diary

# 3. Returns the tasks in the user's todo list
diary = Diary.new
todo_list = TodoList.new
organiser = Organiser.new(diary, todo_list)
task_1 = Todo.new("Hoover house")
task_2 = Todo.new("Make bed")
working_todo_list = organiser.todo_list
todo_list.add(task_1)
todo_list.add(task_2)
organiser.todo_list = working_todo_list
organiser.todo_list # => working_todo_list

# 4. Returns a list of all the mobile numbers in the user's diary
diary = Diary.new
todo_list = TodoList.new
organiser = Organiser.new(diary, todo_list)
entry_1 = DiaryEntry.new("01.03.23", "I met Ted. His number is 075273988010")
entry_2 = DiaryEntry.new("05.03.23", "It snowed today.")
entry_3 = DiaryEntry.new("10.03.21", "I met someone called Sally. Her number is 07865436864.")
working_diary = organiser.diary
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
organiser.diary = working_diary
organiser.contacts # => ["07527398010", "07865436864"]
```