class AddRankToCategoryGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :category_groups, :rank, :integer
  end
end
