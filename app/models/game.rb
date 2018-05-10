class Game < ActiveRecord::Base
  belongs_to :device
  belongs_to :user
  
  def self.valid_params?(params)
    return !params[:name].empty? && !params[:players].empty?
  end
end
