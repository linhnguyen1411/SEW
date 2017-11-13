json.extract! rss_url, :id, :news_site_id, :category_group_id, :url, :created_at, :updated_at
json.url rss_url_url(rss_url, format: :json)
