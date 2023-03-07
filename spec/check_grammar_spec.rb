require "check_grammar"

RSpec.describe "check_grammar method" do
    it "returns a string message" do
        expect(check_grammar("Hello!")).to eq "Your grammar is good."
    end
    it "takes an argument" do
        expect(check_grammar("Hello!")).to eq "Your grammar is good."
    end
    context "when the argument is not a valid string" do
        it "fails" do
            expect{ check_grammar(123) }.to raise_error "Error: please enter a valid string"
            expect{ check_grammar("") }.to raise_error "Error: please enter a valid string"
            expect{ check_grammar(nil) }.to raise_error "Error: please enter a valid string"
        end
    end
    it "checks if the first character is capitalized" do
        expect(check_grammar("Hello, my name is Jack.")).to eq "Your grammar is good."
        expect(check_grammar("hello, my name is jack")).to eq "That's not quite right. Correct your text and try again."
    end
    it "checks if there is appropriate punctuation at end of sentence" do
        expect(check_grammar("Hello, my name is Jack.")).to eq "Your grammar is good."
        expect(check_grammar("Hello, my name is jack")).to eq "That's not quite right. Correct your text and try again."
    end
end