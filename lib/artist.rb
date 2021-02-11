class Artist
    attr_accessor :name
    @@all = Array.new

    def initialize(input)
        p "initialize [Artist] with name: [#{input}]"
        ######################
        @name = input
        @songs = []
        p "adding Artist [#{self}] to @@all: [#{@@all}]"
        @@all << self
        p @@all
    end

    def add_song(input)
        p "==========================="
        p "[add_song]"
        p "input song: [#{input}]"
        ######################
        input.artist = self
        p "set [#{input}]'s artist to [#{self}]"
        ######################
        if @songs.include?(input) == false
            p "@songs doesn't include [#{input.name}], now adding..."
            @songs << input
        end
        p "added song [#{input}] to array [@songs] via [Artist.add_song]"
    end

    def print_songs
        # p "==========================="
        # p "[print_songs]"
        ######################
        @songs.each do |x|
            puts x.name
        end    
    end

    def self.find_or_create_by_name(input)
        p "==========================="
        p "[self.find_or_create_by_name]"
        p "input aritst: [#{input}]"
        ######################
        p "@@all: [#{@@all}]"
        if @@all.include?(input) == false
            p "@@all doesn't include artist with name [#{input}], creating..."
            Artist.new(input)
            p "Artist with name [#{input}] added to array @@all"
            p "@@all is now [#{@@all}]"
        end
        p "searching @@all for Artist with name [#{input}]"
        search_results = @@all.find {|x| x.name = input}
        p "found Artist with name [#{input}] in array @@all"
        return search_results
    end

    def self.song_count
        p "==========================="
        p "[self.song_count]"
        ######################
        p Song.all.count
    end

    def self.all
        p "==========================="
        p "[self.all]"
        ######################
        @@all
    end

    def songs
        p "==========================="
        p "[songs]"
        ######################
        @songs
    end   
end