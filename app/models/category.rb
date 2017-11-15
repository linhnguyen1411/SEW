class Category < ApplicationRecord
  has_many :rss_urls
  belongs_to :category_group
end
