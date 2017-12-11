class News < ApplicationRecord
  before_save :standardize_description
  STANDARDIZE_REGEX = /<a class=\"tag-user-item\" href=\"\/users\/\d{1,}\"><i class=\"fa fa-address-book-o\"><\/i><\/a>|<a href=\"\/users\/\d{1,}\" class=\"tag-user-item\"><\/a>/
  belongs_to :rss_url
  belongs_to :category
  # default_scope { order(pubDate: :desc) }
  scope :ordered_by_date, -> { order(pubDate: :desc) }
  scope :get_news, -> id {where "id < ?",id}
  scope :get_news_by_category, -> id{where category_id: id}
  scope :get_news_by_list_category, ->list {where "category_id IN (?)", list}

  validates :rss_url_id,length: {maximum: 250}, allow_nil: true

  private

  def standardize_description
    description.remove! '<p><br></p>"\r""\n"" "'
    description.remove! STANDARDIZE_REGEX
  end
end
