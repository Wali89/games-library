class Game < ActiveRecord::Base
  belongs_to :device
  
  def self.valid_params?(params)
    return !params[:name].empty? && !params[:players].empty? && params[:players].to_i > 0
  end
end
