class CreateUserCategoryGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_category_groups do |t|
      t.integer :user_id
      t.integer :category_group_id

      t.timestamps
    end
  end
end
