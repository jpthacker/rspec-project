class MusicCollection
    def initialize
        @tracks = []
    end

    def add(track)
        @tracks << track
    end

    def tracks
        @tracks
    end
end