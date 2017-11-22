class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
