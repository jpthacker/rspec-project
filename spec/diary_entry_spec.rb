require "diary_entry"

RSpec.describe DiaryEntry do
    it "contructs an object" do
        diary_entry = DiaryEntry.new("today", "this happened")
        expect(diary_entry.title).to eq "today"
        expect(diary_entry.contents).to eq "this happened"
    end

    describe "count_words method" do
        it "returns the number of words in the contents" do
            diary_entry = DiaryEntry.new("today", "this happened")
            expect(diary_entry.count_words).to eq 2
        end
    end

    describe "reading_time method" do
        it "returns and integer" do
            diary_entry = DiaryEntry.new("today", "this happened")
            expect(diary_entry.reading_time(200))
        end

        it "Returns an estimate of the reading time in minutes for the contents at the given wpm" do
            diary_entry = DiaryEntry.new("today", "")
            expect(diary_entry.reading_time(200)).to eq 0
            diary_entry = DiaryEntry.new("today", "this happened")
            expect(diary_entry.reading_time(200)).to eq 1
            diary_entry = DiaryEntry.new("today", "Lorem ipsum dolor sit amet.")
            expect(diary_entry.reading_time(1)).to eq 5
        end
    end

    describe "reading_chunk method" do
        it "returns a string" do
            diary_entry = DiaryEntry.new("today", "")
            expect(diary_entry.reading_chunk(1, 1)).to eq ""
        end

        it "returns a chunk of the contents based on the words per minute and minutes available" do
            diary_entry = DiaryEntry.new("today", "this happened")
            expect(diary_entry.reading_chunk(1, 1)).to eq "this"
            expect(diary_entry.reading_chunk(200, 1)).to eq "this happened"
            diary_entry = DiaryEntry.new("today", "Lorem ipsum dolor sit amet.")
            expect(diary_entry.reading_chunk(3, 1)).to eq "Lorem ipsum dolor"
        end

        it "returns a chunk of the contents" do
            diary_entry = DiaryEntry.new("today", "this happened today")
            diary_entry.reading_chunk(1, 1)
            # expect(diary_entry.words_read).to eq "this"
            diary_entry = DiaryEntry.new("today", "this happened today")
            diary_entry.reading_chunk(2, 1)
            # expect(diary_entry.words_read).to eq "this happened"
        end
        
        context "when it called multiple times" do
            # it "stores the words read so far in an insatnce variable" do
            #     diary_entry = DiaryEntry.new("today", "Lorem ipsum dolor sit amet.")
            #     diary_entry.reading_chunk(1, 1)
            #     diary_entry.reading_chunk(1, 1)
            #     expect(diary_entry.words_read).to eq "Lorem ipsum"
            # end

            it "returns only the most recent chunk of read words" do
                diary_entry = DiaryEntry.new("today", "Lorem ipsum dolor sit amet.")
                diary_entry.reading_chunk(1, 1)
                diary_entry.reading_chunk(1, 1)
                expect(diary_entry.reading_chunk(1, 1)).to eq "dolor"
                # expect(diary_entry.words_read).to eq "Lorem ipsum dolor"
            end

            context "when the entire contents has been read" do
                it "starts the process again" do
                    diary_entry = DiaryEntry.new("today", "Lorem ipsum dolor sit amet.")
                    diary_entry.reading_chunk(1, 1)
                    diary_entry.reading_chunk(1, 1)
                    diary_entry.reading_chunk(3, 1)
                    expect(diary_entry.reading_chunk(1, 1)).to eq "Lorem"
                end
            end
        end
    end
end