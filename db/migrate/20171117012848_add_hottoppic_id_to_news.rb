class AddHottoppicIdToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :hottopic_id, :integer
  end
end
