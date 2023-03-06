require "count_words"

RSpec.describe "count_words method" do
    it "returns an integer" do
        expect(count_words("Hello world!")).to be_a_kind_of(Integer)
    end
    it "takes a single argument" do
        expect(count_words("hello world!")).to eq 2
    end
    context "when something other than a string is passed as an argument" do
        it "fails" do
            expect {count_words(3)}.to raise_error "Error: argument must be a string" 
        end
    end
    it "Returns the amount of words in a string" do
        expect(count_words("Hello world!")).to be 2
        expect(count_words("Hello, my name is Jack")).to be 5
        expect(count_words("Hello, my name is Jack. I live in Sheffield. I'm an aprentice sofware engineer.")).to be 14
    end
end