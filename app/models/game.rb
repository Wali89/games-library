class Game < ActiveRecord::Base
  has_one :device
  belongs_to :device
  
  def self.valid_params?(params)
    return !params[:name].empty? && !params[:players].empty?
  end
end
