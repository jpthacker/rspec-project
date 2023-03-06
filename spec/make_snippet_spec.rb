# Design

# A method called make_snippet that takes a string as an argument and returns the first five words and then a '...' if there are more than that.

require "make_snippet"

RSpec.describe "make_snippet method" do
    it "returns a string" do
        expect(make_snippet("string")).to be_a_kind_of(String)
    end
    context "when something other than a string is passed as an argument" do
        it "fails" do
            expect {make_snippet(3)}.to raise_error "Error: argument must be a string" 
        end
    end
    it "provides a snippet of a longer string" do
        expect(make_snippet("Hello world! My name is Jack")).to eq "Hello world! My name is..."
    end
end