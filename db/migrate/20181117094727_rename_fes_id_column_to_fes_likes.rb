class RenameFesIdColumnToFesLikes < ActiveRecord::Migration[5.2]
  def change
  	rename_column :fes_likes, :fes_id, :fes_comment_id
  end
end
