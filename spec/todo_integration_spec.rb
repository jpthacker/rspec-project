# require "todo_list"
# require "todo"

# RSpec.describe "todo_list integration" do
#     it "Returns added tasks which are incomplete" do
#         todo_list = TodoList.new
#         task_1 = Todo.new("Hoover house")
#         task_2 = Todo.new("Make bed")
#         todo_list.add(task_1)
#         todo_list.add(task_2)
#         expect(todo_list.incomplete).to eq [task_1, task_2]
#     end
# end