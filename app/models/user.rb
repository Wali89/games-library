class User < ActiveRecord::Base
  has_secure_password
  has_many :devices
  has_many :games, :through => :devices
  

end