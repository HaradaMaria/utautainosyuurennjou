class AddNameKanaToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :name_kana, :string
  end
end
