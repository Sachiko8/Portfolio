class RemoveArtistMovieFromArtist < ActiveRecord::Migration[5.2]
  def change
    remove_column :artists, :artist_movie, :string
  end
end
