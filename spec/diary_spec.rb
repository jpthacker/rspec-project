require "diary"

RSpec.describe Diary do
    it "contructs an object" do
        diary = Diary.new
        expect(diary.instance_of?(Diary)).to eq true
    end
end