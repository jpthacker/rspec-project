```ruby
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

# File: lib/todo.rb
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

# TodoList Tests

# 1. Returns added tasks which are incomplete
todo_list = TodoList.new
task_1 = Todo.new("Hoover house")
task_2 = Todo.new("Make bed")
todo_list.add(task_1)
todo_list.add(task_2)
todo_list.incomplete # => [task_1, task_2]

# 2. Returns added tasks which are complete
todo_list = TodoList.new
task_1 = Todo.new("Hoover house")
task_2 = Todo.new("Make bed")
todo_list.add(task_1)
todo_list.add(task_2)
todo_list.task_list[0].mark_done!
todo_list.incomplete # => [task_1]

# 3. Marks all tasks as complete
todo_list = TodoList.new
task_1 = Todo.new("Hoover house")
task_2 = Todo.new("Make bed")
todo_list.add(task_1)
todo_list.add(task_2)
todo_list.give_up!
todo_list.complete # => [task_1, task_2]

# Todo Tests

# 1. It returns the task as a string
todo = Todo.new("Hoover stairs")
todo.task # => "Hoover stairs"

# 2. Marks a task as done
todo = Todo.new("Hoover stairs")
todo.mark_done!
todo.done? # => true

# 3 Checks if a task is done or not
todo = Todo.new("Hoover stairs")
todo.done? # => false
```