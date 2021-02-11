class MP3Importer
    attr_accessor :path
    def initialize(input)
        p "initialize [MP3Importer] with filepath: [#{input}]"
        ######################
        @path = input
    end

    def path
        p "==========================="
        p "[path]"
        ######################
        p "@apath: [#{@path}]"
        @path
    end

    def files
        p "==========================="
        p "[files]"
        ######################
        p "Finding all .mp3 files in directory [#{@path}]"
        Dir["#{@path}/*.mp3"].map{ |x| x.gsub("#{@path}/", "")}
    end

    def import
        p "==========================="
        p "[import]"
        ######################
        files.each do |x|
            Song.new_by_filename(x)
        end
    end
end