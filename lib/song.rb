require 'pry'
require 'artist.rb'
require 'mp3_importer.rb'

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist = artist
        @@all << self
    end

    def self.all
        @@all
    end

    def artist=(artist)
        @artist = artist
    end    
    
    def artist_name=(artist)
        @artist = Artist.find_or_create_by_name(artist)
    end

    def self.new_by_filename(filename)
        song_title = filename.split(" - ")[1]
        song_artist = filename.split(" - ")[0]
        song = self.new(song_title)
        song.artist_name = song_artist
        song
    end

end