class Category < ApplicationRecord
  has_many :rss_urls
  has_many :news
  belongs_to :category_group
end
