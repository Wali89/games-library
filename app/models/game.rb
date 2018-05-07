class Game < ActiveRecord::Base
  belongs_to :user
  has_many :game_platforms
  has_many :platforms, through => :game_platforms

  def slug 
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Song.all.find{|song| song.slug == slug}
  end

  def self.valid_params?(params)
    return !params[:name].empty?
  end
end
