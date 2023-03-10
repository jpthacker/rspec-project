require "organiser"

RSpec.describe Organiser do
    diary = "diary"
    todo_list = "todo list"
    it "contructs an object" do
        organiser = Organiser.new(diary, todo_list)
        expect(organiser.instance_of?(Organiser)).to eq true
    end
end