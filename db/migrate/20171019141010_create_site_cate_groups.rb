class CreateSiteCateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :site_cate_groups do |t|
      t.integer :news_site_id
      t.integer :cate_group_id

      t.timestamps
    end
  end
end
