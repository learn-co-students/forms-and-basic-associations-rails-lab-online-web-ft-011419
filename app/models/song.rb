class Song < ActiveRecord::Base
  # add associations here

  belongs_to :artist
  belongs_to :genre
  has_many :notes



  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def note_contents=(notes)
    notes.each do |n|
      if n != ""
        self.notes.build(content: n)
      end
    end
  end

  def note_contents
    self.notes.map {|n| n.content}
  end
end

