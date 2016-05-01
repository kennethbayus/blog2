class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true, uniqueness: true
	validates :body, presence: true

end
