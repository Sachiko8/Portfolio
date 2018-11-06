class RemoveMovieFromMovie < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :movie, :string
  end
end
