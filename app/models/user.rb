class User < ActiveRecord::Base
  has_many :posts

  has_secure_password
  mount_uploader :photo, PhotoUploader

  validates :username, presence: true
	validates :printname, presence: true
  validates :password, presence: true


end
