class User < ActiveRecord::Base
  has_many :posts

  has_secure_password
  mount_uploader :photo, PhotoUploader

  validates :username, presence: true
	validates :printname, presence: true
  validates :password, presence: true

  before_save :generate_slug

	def to_param
		self.slug
	end

  def generate_slug
    str = username.strip
    str.gsub! /\s*[^A-Za-z0-9]\s*/,'-'
    str.gsub! /-+/,"-"
    self.slug = str
  end

end
