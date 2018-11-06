class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :artist_id

      t.timestamps
    end
  end
end
