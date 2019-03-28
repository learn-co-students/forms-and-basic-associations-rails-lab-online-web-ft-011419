class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artists
  belongs_to :genres
  has_many :notes
end
