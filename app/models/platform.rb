class Platform < ActiveRecord::Base
  has_many :games
  belongs_to :user
  
  def self.valid_params?(params)
    return !params[:name].empty? && !params[:capacity].empty?
  end
end
