class Song
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = Array.new

    def initialize(input)
        p "initialize [Song] with name: [#{input}]"
        ######################
        @name = input
        @artist = nil
        @genre = nil
        ######################
        p "adding Song [#{self}] to @@all: [#{@@all}]"
        @@all << self
        p @@all
    end
    
    def artist=(input)
        p "==========================="
        p "[artist]"
        p "input artist: [#{input}]"
        ######################
        @artist = input
        p "[#{self}]'s @artist.name is now [#{@artist}]"
        @artist.songs << self
        ######################
        if Artist.all.include?(@artist) == false
            p "Artist.all doesn't include [#{@artist}], now creating..."
            newArtist = Artist.new(@artist)
            newArtist
            if newArtist.songs.include?(self) == false
                p "@artist.songs doesn't include [#{input}], now adding..."
                newArtist.songs << self
                p "added song [#{self}] to the Artist array: [@songs] via [Song.artist]"
            end
        else
            p "Artist.all includes [#{@artist}]"
            if @artist.songs.include?(self) == false
                p "@artist.songs doesn't include [#{input}], now adding..."
                @artist.songs << self
                p "added song [#{self}] to the Artist array: [@songs] via [Song.artist]"
            end
        end
    end

    def artist_name
        p "==========================="
        p "[artist_name]"
        ######################
        if @artist == nil
            @artist
        else
            @artist.name
        end
    end

    def artist_name=(input)
        p "==========================="
        p "[artist_name=]"
        ######################
        if  Artist.all.find {|x| x.name == input} == nil
            p "Artist.all doesn't include [#{input}], now creating..."
            newArtist = Artist.new(input)
            @artist = newArtist
        else
            newArtist = Artist.all.find {|x| x.name == input}
            p "Artist.all includes [#{input}]"
            @artist = newArtist
        end
    end
    
    def self.new_by_filename(input)
        p "==========================="
        p "[self.new_by_filename]"
        p "input song: [#{input}]"
        ######################
        fileartist = input.gsub(".mp3", "").split(" - ")[0]
        filesong = input.gsub(".mp3", "").split(" - ")[1]
        filegenre = input.gsub(".mp3", "").split(" - ")[2]
        ######################
        if @@all.include?(filesong) == false
            p "@@all doesn't include song with name [#{filesong}], creating..."
            newsong = Song.new(filesong)
            newartist = Artist.new(fileartist)
            newsong.artist = newartist
            p "Song with name [#{filesong}] added to array @@all"
            p "@@all is now [#{@@all}]"
            newsong
        end
    end

    def self.all
        p "==========================="
        p "[self.all]"
        ######################
        @@all
    end
end