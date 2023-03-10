require "todo_list"
require "todo"

RSpec.describe "todo_list integration" do
    it "Returns added tasks which are incomplete" do
        todo_list = TodoList.new
        task_1 = Todo.new("Hoover house")
        task_2 = Todo.new("Make bed")
        todo_list.add(task_1)
        todo_list.add(task_2)
        expect(todo_list.incomplete).to eq [task_1, task_2]
    end

    it "Returns added tasks which are complete" do
        todo_list = TodoList.new
        task_1 = Todo.new("Hoover house")
        task_2 = Todo.new("Make bed")
        todo_list.add(task_1)
        todo_list.add(task_2)
        task_2.mark_done!
        expect(todo_list.complete).to eq [task_2]
    end

    it "Marks all tasks as complete" do
        todo_list = TodoList.new
        task_1 = Todo.new("Hoover house")
        task_2 = Todo.new("Make bed")
        todo_list.add(task_1)
        todo_list.add(task_2)
        todo_list.give_up!
        expect(todo_list.incomplete).to eq []
        expect(todo_list.complete).to eq [task_1, task_2]
    end

end