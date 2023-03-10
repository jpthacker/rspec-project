require "todo_list"

RSpec.describe TodoList do
    it "contructs an object" do
        todo_list = TodoList.new
        expect(todo_list.instance_of?(TodoList)).to eq true
    end
end