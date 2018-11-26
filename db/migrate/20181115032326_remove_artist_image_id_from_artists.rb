class RemoveArtistImageIdFromArtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :artists, :artist_image_id, :string
  end
end
