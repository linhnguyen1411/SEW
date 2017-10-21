class NewsSite < ApplicationRecord
	has_many :site_cate_groups
	has_many :category_groups, through: :site_cate_groups
end
