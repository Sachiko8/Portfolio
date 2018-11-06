class CreateLives < ActiveRecord::Migration[5.2]
  def change
    create_table :lives do |t|
      t.datetime :when
      t.integer :place_id
      t.string :live_title
      t.integer :artist_id

      t.timestamps
    end
  end
end
