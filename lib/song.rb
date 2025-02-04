class Song 
attr_accessor :artist, :name
  @@all = []
  def initialize(name)
    @name = name
    save
  end
  
  def self.all 
    @@all 
  end
  
  def save 
    @@all << self #self is an instance of a song
  end
  
   def artist_name=(artist_name)
        @artist = Artist.find_or_create_by_name(artist_name)
        @artist.add_song(self)
    end
    
   def self.new_by_filename(file_name)
        file_name_arr = file_name.split(" - ")
        artist_name = file_name_arr[0]
        song_name = file_name_arr[1]
        @song = Song.new(song_name)
        @song.artist_name = artist_name
        # @song.artist = Artist.find_or_create_by_name(artist_name)
        @song
    end
  
  
end