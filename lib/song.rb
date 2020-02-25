class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    #instantiates and saves song, returns the new song that was created
    song1 = Song.new
    song1.save
    song1
  end

  def self.new_by_name(name_input)
    #Song.new_by_name("Hello") => ["Hello", "nil"]
    song1 = self.new
    song1.name = name_input
    song1
  end

  def self.create_by_name(name_input)
    song1 = self.create
    song1.name = name_input
    song1
  end 

  def self.find_by_name(name_input)
    self.all.find do |object_body|
      object_body.name == name_input
    end
  end

  def self.find_or_create_by_name(input)
    self.find_by_name(input) || self.create_by_name(input)
  end

  def self.alphabetical
    self.all.sort_by do |body|
      body.name
    end
  end

  def self.new_from_filename(filename)
    filename_arr = filename.split("-")
    artist_name = filename_arr[0]
    song_name = filename_arr[1].gsub(".mp3","")

    song1 = self.new
    song1.artist_name = artist_name.strip
    song1.name = song_name.strip
    song1
  end

  def self.create_from_filename(filename)
    filename_arr = filename.split("-")
    artist_name = filename_arr[0]
    song_name = filename_arr[1].gsub(".mp3","")

    song1 = self.create
    song1.artist_name = artist_name.strip
    song1.name = song_name.strip
    song1
  end

  def self.destroy_all
    self.all.clear
  end
  
end
