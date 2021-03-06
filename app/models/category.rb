class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true, uniqueness: true

  before_save :generate_slug

	def to_param
		self.slug
	end

  def generate_slug
    str = name.strip
    str.gsub! /\s*[^A-Za-z0-9]\s*/,'-'
    str.gsub! /-+/,"-"
    self.slug = str
  end

end
