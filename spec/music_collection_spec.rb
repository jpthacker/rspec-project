require "music_collection"

RSpec.describe MusicCollection do
    music_collection = MusicCollection.new
    music_collection.add("Sweet Home Alabama")
    it "contructs an object" do
        expect(music_collection.tracks).to eq ["Sweet Home Alabama"]
    end

    describe "add method" do
        it "add a track to a list" do
            music_collection.add("Wonderwall")
            expect(music_collection.tracks).to eq ["Sweet Home Alabama", "Wonderwall"]
        end
    end

    describe "tracks method" do
        it "return a list of added tracks" do
            music_collection.add("Californication")
            expect(music_collection.tracks).to eq ["Sweet Home Alabama", "Wonderwall", "Californication"]
        end
    end
end