class Song < ActiveRecord::Base
  # add associations here
  belongs_to  :artist
  belongs_to  :genre
  has_many :notes
  def genre_ids=(ids)
     ids.each do |id|
      genre = Genre.find(id)
       self.genres << genre
     end
  end
  def genre_name=(name)
  self.genre = Genre.find_or_create_by(name: name)
  end
  def  genre_name
    self.genre ? self.genre.name : nil
  end 
  def  artist_name=(name)
  self.artist = Artist.find_or_create_by(name: name)
  end
  def   artist_name
    self.artist ? self.artist.name : nil
  end 
 
 
 
 # def note_contents=(content)
 # self.note = Notes.find_or_create_by(content: content)
 # end
 # def  note_contents
  #  self.note ? self.note.content : nil
  #end 





end
