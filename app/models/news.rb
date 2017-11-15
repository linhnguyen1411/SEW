class News < ApplicationRecord
	belongs_to :rss_url
  default_scope { order(pubDate: :desc) }
  scope :get_five_news, -> id {where "id < ?",id}
end
