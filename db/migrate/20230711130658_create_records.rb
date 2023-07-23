class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer :user_id
      t.integer :song_id
      t.decimal :score, precision: 5, scale: 2
      t.string :key
      t.string :share
      t.string :memo
      t.timestamps
    end
  end
end
