require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def  self.find_by_name(name)
    all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name) 
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name }
  end

  def self.new_from_filename(filename)
    name_array = filename.split(/\ \- |\./)
    artist_name = name_array[0]
    song_name = name_array[1]
    
    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    name_array = filename.split(/\ \- |\./)
    artist_name = name_array[0]
    song_name = name_array[1]

    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

#I know i can use .clear, but i wanted to see if I could do it this way

  def self.destroy_all
    self.all = []
  end

  def self.all=(destroy=[])
    @@all = destroy
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
