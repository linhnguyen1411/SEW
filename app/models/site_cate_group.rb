class SiteCateGroup < ApplicationRecord
	belongs_to :category_group
	belongs_to :news_site
end
