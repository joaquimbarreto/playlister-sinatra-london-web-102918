class Artist < ActiveRecord::Base

  has_many :songs

  def songs
    songs = []
  end


end
