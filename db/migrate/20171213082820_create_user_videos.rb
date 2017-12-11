class CreateUserVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_videos do |t|
      t.integer :user_id
      t.string :title
      t.text :url

      t.timestamps
    end
  end
end
