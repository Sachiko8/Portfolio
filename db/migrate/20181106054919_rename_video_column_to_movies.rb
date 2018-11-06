class RenameVideoColumnToMovies < ActiveRecord::Migration[5.2]
  def change
  	rename_column :movies, :video, :movie
  end
end
