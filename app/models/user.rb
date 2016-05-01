class User < ActiveRecord::Base
  has_many :posts

  has_secure_password

  validates :username, presence: true
	validates :printname, presence: true


end
