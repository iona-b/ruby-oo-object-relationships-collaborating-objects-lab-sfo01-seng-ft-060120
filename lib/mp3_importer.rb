require 'pry'

class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        files = []
        files = Dir[path + "/*.mp3"]
        files.map { |file| file.slice! "#{path}/" }
        files
    end

    def import
        files.each { |filename| Song.new_by_filename(filename) }
    end

end