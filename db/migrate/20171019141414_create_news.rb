class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.integer :category_group_id
      t.string :title
      t.text :description
      t.date :pubDate
      t.string :link
      t.string :site
      t.boolean :highlight
      t.timestamps
    end
  end
end
