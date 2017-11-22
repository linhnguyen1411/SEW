class CategoryGroup < ApplicationRecord
	# has_many :site_cate_groups
	has_many :user_category_groups
	has_many :users, through: :user_category_groups
  has_many :categories
  scope :oder_by_rank, -> {order rank: :desc}
end
