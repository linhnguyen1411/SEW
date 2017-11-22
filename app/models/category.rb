class Category < ApplicationRecord
  has_many :rss_urls
  has_many :blogs
  belongs_to :category_group

  scope :get_list_category, ->id {where category_group_id: id}
  scope :get_list_category_by_list, -> list {where "category_group_id IN (?)", list}
end
