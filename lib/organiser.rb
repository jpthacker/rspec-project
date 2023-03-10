require_relative "diary"
require_relative "todo_list"
require_relative "diary_entry"

class Organiser
    def initialize(diary, todo_list) # diary and todo_list are instances of Diary and TodoList, respectively
      @diary = diary
      @todo_list = todo_list
    end
    attr_accessor :diary, :todo_list
  
    def contacts
      all_entries = []
      @diary.all.each {|entry| all_entries << entry.contents}
      words = all_entries.map {|str| str.gsub(/[^0-9{11}]/, "")}
      words.filter {|entry| entry[0..1] == "07"}
    end
  end