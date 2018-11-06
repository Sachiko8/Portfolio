class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.text :artist_details
      t.string :artist_image_id
      t.string :artist_movie

      t.timestamps
    end
  end
end
