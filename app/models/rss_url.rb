class RssUrl < ApplicationRecord
  belongs_to :news_site
  belongs_to :category
  has_many :news
end
