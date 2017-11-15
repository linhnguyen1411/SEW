class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.integer :category_id
      t.integer :rss_url_id
      t.integer :news_site_id
      t.string :title
      t.text :description
      t.date :pubDate
      t.string :link
      t.boolean :highlight
      t.timestamps
    end
  end
end
