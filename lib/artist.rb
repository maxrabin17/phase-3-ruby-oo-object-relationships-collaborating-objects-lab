class Artist
    
    @@all = []
    attr_accessor :name, :songs


    def initialize(name)
        @name = name
        # @songs = []
        # @@all << self
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all    
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    # def self.find_or_create_by_name(name)
    #     self.find(name) ? self.find(name) : self.new(name)
    # end

    # def self.find(name)
    #     self.all.find {|artist| artist.name == name}
    # end

    # def self.find_or_create_by_name(name)
    #     artist = self.all.find {|artist| artist.name == name}
    #     if artist
    #         artist
    #     else
    #         self.new(name)
    #     end
    # end

    def self.find_or_create_by_name(name)
        self.all.detect { |artist| artist.name == name } || self.new(name)
    end

    def print_songs
        songs.each {|song| puts song.name}
    end
end