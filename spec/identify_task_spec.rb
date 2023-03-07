require "identify_task"

RSpec.describe "identify_task method" do
    it "returns a boolean" do
        expect(identify_task("#TODO")).to eq true
    end

    it "checks if string contains '#TODO'" do
        expect(identify_task("#TODO: clean bathroom")).to eq true
        expect(identify_task("Hoover (#TODO)")).to eq true
        expect(identify_task("#TODO: clean bathroom (#TODO)")).to eq true
        expect(identify_task("Clean bathroom")).to eq false
    end

    context "when it is passed an invalid argument" do
        it "fails" do
            expect{ identify_task("") }.to raise_error "Error: please enter a valid string"
            expect{ identify_task(nil) }.to raise_error "Error: please enter a valid string"
        end
    end
end