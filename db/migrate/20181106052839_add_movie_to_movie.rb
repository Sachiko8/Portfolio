class AddMovieToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :movie, :string
  end
end
