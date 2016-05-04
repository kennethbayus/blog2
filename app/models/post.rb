class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  belongs_to :user

  mount_uploaders :photos, PhotoUploader

  validates :title, presence: true, uniqueness: true
	validates :body, presence: true

  before_save :generate_slug

	def to_param
		self.slug
	end

  def generate_slug
    str = title.strip
    str.gsub! /\s*[^A-Za-z0-9]\s*/,'-'
    str.gsub! /-+/,"-"
    self.slug = str
  end

end
