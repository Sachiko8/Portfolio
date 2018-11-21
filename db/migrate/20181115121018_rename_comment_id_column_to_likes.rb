class RenameCommentIdColumnToLikes < ActiveRecord::Migration[5.2]
  def change
  	rename_column :likes, :like_id, :comment_id
  end
end
