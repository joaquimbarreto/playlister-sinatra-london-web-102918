class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  # def songs
  #   songs = []
  # end

  def slug
    self.name.downcase.gsub(/ /, "-")
  end

  def self.find_by_slug(text)
    name = text.gsub(/-/, " ").split.map(&:capitalize).join(' ')
    Artist.all.find do |a|
      a.name == name
    end
  end

end
