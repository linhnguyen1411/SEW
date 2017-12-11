class ChangeDataTypeForUrl < ActiveRecord::Migration[5.1]
  def change
    change_column(:user_musics, :url, :text)
  end
end
