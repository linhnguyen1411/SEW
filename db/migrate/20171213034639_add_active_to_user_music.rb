class AddActiveToUserMusic < ActiveRecord::Migration[5.1]
  def change
    add_column :user_musics, :active, :boolean
  end
end
