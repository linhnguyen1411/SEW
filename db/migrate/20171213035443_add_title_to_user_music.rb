class AddTitleToUserMusic < ActiveRecord::Migration[5.1]
  def change
    add_column :user_musics, :title, :text
  end
end
