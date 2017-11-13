class CreateRssUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :rss_urls do |t|
      t.integer :news_site_id
      t.integer :category_id
      t.string :url

      t.timestamps
    end
  end
end
