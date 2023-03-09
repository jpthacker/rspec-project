require "diary"
require "diary_entry"

RSpec.describe "Diary Integration" do
    it "gets all diary entries" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("entry_1", "this happened today")
        diary_entry_2 = DiaryEntry.new("entry_2", "this happened yesterday")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.all).to eq [diary_entry_1, diary_entry_2]
    end

    it "returns the word count of all diary entries" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("entry_1", "this happened today")
        diary_entry_2 = DiaryEntry.new("entry_2", "this happened yesterday")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.count_words).to eq 6
    end

    it "returns the reading time for all diary entries" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("entry_1", "this happened today")
        diary_entry_2 = DiaryEntry.new("entry_2", "this happened yesterday")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.reading_time(1)).to eq 6
    end

    it "returns the best entry for reading time" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("entry_1", "this happened today")
        diary_entry_2 = DiaryEntry.new("entry_2", "this happened yesterday. It was my birthday!")
        diary_entry_3 = DiaryEntry.new("entry_3", "this happened the day before yesterday.")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        diary.add(diary_entry_3)   
        expect(diary.find_best_entry_for_reading_time(2, 3)).to eq diary_entry_3
    end
end