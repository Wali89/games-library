class Game < ActiveRecord::Base
  belongs_to :platform

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:manufacturer].empty
  end
end
