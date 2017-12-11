class ChangeDataTypeForPubDate < ActiveRecord::Migration[5.1]
  def change
    change_column(:news, :pubDate, :datetime)
  end
end
