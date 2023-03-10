class Todo
    def initialize(task) # task is a string
      @task = task
    end
  
    def task
      @task
    end
  
    def mark_done!
      @done = true
    end
  
    def done?
        @done ? true : false
    end
end