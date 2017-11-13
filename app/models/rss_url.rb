class RssUrl < ApplicationRecord
  belongs_to :news_site
  belongs_to :category_group
end
