class Platform < ActiveRecord::Base
  belongs_to :user
  has_many :game_platforms
  has_many :games, :through => :game_platforms
  
  def slug
    name.downcase.gsub(" ","-")
  end
  
  def self.valid_params?(params)
    return !params[:name].empty? && !params[:capacity].empty?
  end
end