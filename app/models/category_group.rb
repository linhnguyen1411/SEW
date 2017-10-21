class CategoryGroup < ApplicationRecord
	has_many :site_cate_groups
	has_many :news_sites, through: :site_cate_groups
	has_many :user_category_groups
	has_many :users, through: :user_category_groups
	has_many :categories
end
