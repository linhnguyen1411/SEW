class UserCategoryGroup < ApplicationRecord
	belongs_to :user
	belongs_to :category_group
end
