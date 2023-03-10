class Organiser
    def initialize(diary, todo_list) # diary and todo_list are instances of Diary and TodoList, respectively
      @diary # => A list of instances of diary entries added to the organiser
      @todo_list # => A list of instances tasks added to the organiser
    end
  
    def contacts
      # Returns a list of mobile numbers contained within @diary
    end
  end