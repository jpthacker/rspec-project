require "reading_time_estimator"

RSpec.describe "reading_time_estimator method" do
    it "returns an message" do
        expect(reading_time_estimator(1)).to eq "This text will take 1 minute to read"
    end
    it "takes an argument" do
        expect(reading_time_estimator(200)).to eq "This text will take 1 minute to read"
    end
    context "when argument is not an integer" do
        it "fails" do
            expect { reading_time_estimator("hello") }.to raise_error "Error: word count must be an integer"
            expect { reading_time_estimator("11") }.to raise_error "Error: word count must be an integer"
        end
    end
    it "Divides a text length by words per minute" do
        expect(reading_time_estimator(400)).to eq "This text will take 2 minutes to read"
        expect(reading_time_estimator(1000)).to eq "This text will take 5 minutes to read"
    end
    it "Rounds numbers up to the nearest integer" do
        expect(reading_time_estimator(475)).to eq "This text will take 3 minutes to read"
    end
end