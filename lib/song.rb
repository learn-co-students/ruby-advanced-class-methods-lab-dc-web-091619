class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create
    song = Song.new
    song.save
    song
  end
  
  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end
  
  def self.create_by_name(title)
    song = Song.new_by_name(title)
    song.save
    song
  end
  
  def self.find_by_name(title)
    self.all.find{|song|
      song if song.name == title
    }
  end
  
  def self.find_or_create_by_name(title)
    song = self.find_by_name(title)
    if song == NIL
      self.create_by_name(title)
    else
      song
    end
  end

  def save
    self.class.all << self
  end
  
  def self.alphabetical
    self.all.sort_by{|song|
      song.name}
  end
  
  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    song = self.create_by_name(song_info[1].delete_suffix('.mp3'))
    song.artist_name = song_info[0]
    song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  def self.destroy_all
    self.all.clear
  end
end
