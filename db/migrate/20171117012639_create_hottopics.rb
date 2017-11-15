class CreateHottopics < ActiveRecord::Migration[5.1]
  def change
    create_table :hottopics do |t|
      t.string :title
      t.boolean :highlight

      t.timestamps
    end
  end
end
