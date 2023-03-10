require "todo"

RSpec.describe Todo do
    it "contructs an object" do
        todo = Todo.new("Hoover stairs.")
        expect(todo.instance_of?(Todo)).to eq true
    end

    it "returns the task as a string" do
        todo = Todo.new("Hoover stairs")
        expect(todo.task).to eq "Hoover stairs"
        todo = Todo.new("Clean bathroom")
        expect(todo.task).to eq "Clean bathroom"
    end

    it "Marks a task as done" do
        todo = Todo.new("Hoover stairs")
        todo.mark_done!
        expect(todo.done?).to eq true
    end

    it "Checks if a task is done or not" do
        todo = Todo.new("Hoover stairs")
        expect(todo.done?).to eq false
    end
end
