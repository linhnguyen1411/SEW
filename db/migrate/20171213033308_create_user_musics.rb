class CreateUserMusics < ActiveRecord::Migration[5.1]
  def change
    create_table :user_musics do |t|
      t.integer :user_id
      t.text :url
      t.text :description

      t.timestamps
    end
  end
end
