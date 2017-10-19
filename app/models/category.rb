class Category < ApplicationRecord
	has_many :news
	belongs_to :site_cate_group

end
