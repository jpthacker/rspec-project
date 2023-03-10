require "organiser"
require "diary"
require "diary_entry"
require "todo_list"
require "todo"

RSpec.describe "organiser integration" do
    it "Returns all diary entries in the user's diary" do
        diary = Diary.new
        todo_list = TodoList.new
        organiser = Organiser.new(diary, todo_list)
        entry_1 = DiaryEntry.new("09.03.23", "It snowed.")
        entry_2 = DiaryEntry.new("10.03.23", "It snowed again. Then it thawed.")
        working_diary = organiser.diary
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.all).to eq [entry_1, entry_2]
        organiser.diary = working_diary
        expect(organiser.diary).to eq working_diary
    end

    it "Returns the best entry based on the user's reading time" do
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
        expect(diary.find_best_entry_for_reading_time(2, 3)).to eq entry_3
        organiser.diary = working_diary
        expect(organiser.diary).to eq working_diary
    end

    it "Stores the user's tasks in a todo list contained within the organiser" do
        diary = Diary.new
        todo_list = TodoList.new
        organiser = Organiser.new(diary, todo_list)
        task_1 = Todo.new("Hoover house")
        task_2 = Todo.new("Make bed")
        working_todo_list = organiser.todo_list
        todo_list.add(task_1)
        todo_list.add(task_2)
        organiser.todo_list = working_todo_list
        expect(organiser.todo_list).to eq working_todo_list
    end

    it "Returns a list of all the mobile numbers in the user's diary" do
        diary = Diary.new
        todo_list = TodoList.new
        organiser = Organiser.new(diary, todo_list)
        entry_1 = DiaryEntry.new("01.03.23", "I met Ted. His number is 07527398801")
        entry_2 = DiaryEntry.new("05.03.23", "It snowed today. It was -27 degrees")
        entry_3 = DiaryEntry.new("10.03.21", "I met someone called Sally. Her number is 07865436864.")
        working_diary = organiser.diary
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        organiser.diary = working_diary
        expect(organiser.contacts).to eq ["07527398801", "07865436864"]
    end
end