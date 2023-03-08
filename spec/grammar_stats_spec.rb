require "grammar_stats"

RSpec.describe GrammarStats do
    it "contructs an object" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("Hello world!")).to eq true
    end

    describe "check method" do
        it "returns a boolean" do
            grammar_stats = GrammarStats.new
            expect(grammar_stats.check("Happy birthday!")).to eq true
        end

        it "Returns true or false depending on whether the text begins with a capital" do
            grammar_stats = GrammarStats.new
            expect(grammar_stats.check("My name is Jack!")).to eq true
            expect(grammar_stats.check("my name is jack")).to eq false
        end

        it "Returns true or false depending on whether the text ends with a sentence-ending punctuation mark" do
            grammar_stats = GrammarStats.new
            expect(grammar_stats.check("My name is Jack!")).to eq true
            expect(grammar_stats.check("My name is jack")).to eq false
        end
    end

    describe "percentage_good method" do
        it "returns an integer" do
            grammar_stats = GrammarStats.new
            grammar_stats.check("My name is Jack.")
            expect(grammar_stats.percentage_good).to be_kind_of(Integer)
        end

        it "Returns the percentage of texts checked so far that passed the `check` method" do
            grammar_stats = GrammarStats.new
            grammar_stats.check("My name is Jack.")
            expect(grammar_stats.percentage_good).to be 1
            grammar_stats.check("Hello World!")
            expect(grammar_stats.percentage_good).to be 2
            grammar_stats.check("Hello World")
            expect(grammar_stats.percentage_good).to be 2
            grammar_stats.check("hello World!")
            expect(grammar_stats.percentage_good).to be 2
            grammar_stats.check("It's my brithday!")
            expect(grammar_stats.percentage_good).to be 3
        end
    end
end
