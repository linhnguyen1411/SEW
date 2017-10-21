class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.integer :category_id
      t.string :title
      t.text :description
      t.date :pubDate
      t.string :link

      t.timestamps
    end
  end
end
