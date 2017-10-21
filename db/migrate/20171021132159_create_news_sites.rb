class CreateNewsSites < ActiveRecord::Migration[5.0]
  def change
    create_table :news_sites do |t|
      t.string :name
      t.string :url
      t.integer :rating

      t.timestamps
    end
  end
end
