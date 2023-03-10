require_relative "todo"

class TodoList
    def initialize
        @task_list = []
    end
  
    def add(todo) # todo is an instance of Todo
      @task_list << todo
    end
  
    def incomplete
      @task_list.select {|task| task.done? == false}
    end
  
    def complete
        @task_list.select {|task| task.done? == true}
    end
  
    def give_up!
      @task_list.each {|task| task.mark_done!}
    end
end