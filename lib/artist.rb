require 'pry'
require 'song.rb'

class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select do|song|
            song.artist == self
        end
    end

    def self.find_or_create_by_name(artist_name)
        artist = @@all.find { |artist| artist.name == artist_name }
        if artist != nil
            return artist
        else
            new_artist = self.new(artist_name)
            new_artist
        end 
    end

    def print_songs
        Song.all.each do |song|
            if song.artist == self
                puts song.name
            end
        end
    end
end