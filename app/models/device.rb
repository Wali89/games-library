class Device < ActiveRecord::Base
  has_many :games
  belongs_to :user
  
  def self.valid_params?(params)
    return !params[:name].empty? && !params[:company].empty?
  end
end
