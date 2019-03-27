class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def note_contents=(notes)
    notes.each do |note|
      if note.strip != ""
        self.notes << Note.find_or_create_by(content: note)
      end
    end
  end

  def note_contents
    self.notes.map { |note| note.content}
  end

end
