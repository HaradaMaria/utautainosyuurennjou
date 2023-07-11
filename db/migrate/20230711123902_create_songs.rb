class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :songwriter
      t.string :composer
      t.string :tie_up
      t.timestamps
    end
  end
end
