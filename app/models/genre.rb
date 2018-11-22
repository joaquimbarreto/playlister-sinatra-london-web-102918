class Genre < ActiveRecord::Base

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(/ /, "-")
  end

  def self.find_by_slug(text)
    name = text.gsub(/-/, " ").split.map(&:capitalize).join(' ')
    Genre.all.find do |a|
      a.name == name
    end
  end


end
