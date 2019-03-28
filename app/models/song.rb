class Song < ActiveRecord::Base
  belongs_to :artists
  belongs_to :genres
  has_many :notes 
end
