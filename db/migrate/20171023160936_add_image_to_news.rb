class AddImageToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :image, :text
  end
end
