class CreateSiteCateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :site_cate_groups do |t|
      t.integer :news_sites_id
      t.integer :cate_groups_id

      t.timestamps
    end
  end
end
