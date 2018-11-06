class AddVideoToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :video, :text
  end
end
