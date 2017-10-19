class SiteCateGroup < ApplicationRecord
	has_many :categorys
	belongs_to :category_group
	belongs_to :news_site
end
