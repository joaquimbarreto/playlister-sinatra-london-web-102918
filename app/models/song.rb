class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(/ /, "-")
  end

  def self.find_by_slug(text)
    name = text.gsub(/-/, " ").split.map(&:capitalize).join(' ')
    Song.all.find do |a|
      a.name == name
    end
  end


end
