require "estimate_reading_time"

RSpec.describe "estimate_reading_time method" do
    it "returns a message" do
        expect(estimate_reading_time(1)).to eq "This text will take 1 minute to read"
    end
    it "takes an argument" do
        expect(estimate_reading_time(200)).to eq "This text will take 1 minute to read"
    end
    context "when argument is not an integer" do
        it "fails" do
            expect { estimate_reading_time("hello") }.to raise_error "Error: word count must be an integer"
            expect { estimate_reading_time("11") }.to raise_error "Error: word count must be an integer"
        end
    end
    it "Divides a text length by words per minute" do
        expect(estimate_reading_time(400)).to eq "This text will take 2 minutes to read"
        expect(estimate_reading_time(1000)).to eq "This text will take 5 minutes to read"
    end
    it "Rounds numbers up to the nearest integer" do
        expect(estimate_reading_time(475)).to eq "This text will take 3 minutes to read"
    end
end