require 'pry'
class Song

    @@all = []
    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        @@all << self
        #save
    end

    def self.all
        @@all
    end

    # def save
    #     @@all << self
    # end

    def self.new_by_filename(filename)
        split_array = filename.split(" - ")
        song = self.new(split_array[1])
        song.artist_name = split_array[0]
        song
        # song.artist
        # binding.pry 
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end