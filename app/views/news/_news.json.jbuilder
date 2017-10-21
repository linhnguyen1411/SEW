json.extract! news, :id, :category_id, :title, :description, :pubDate, :link, :created_at, :updated_at
json.url news_url(news, format: :json)
