class News < ApplicationRecord
	belongs_to :rss_url
  belongs_to :category
  # default_scope { order(pubDate: :desc) }
  scope :ordered_by_date, -> { order(pubDate: :desc) }
  scope :get_news, -> id {where "id < ?",id}
  scope :get_news_by_category, -> id{where category_id: id}
  scope :get_news_by_cate_group, ->list {where "category_id IN ?",list.to_a}
end
