class RenameLikeIdColumnToLikes < ActiveRecord::Migration[5.2]
  def change
  	rename_column :likes, :live_id, :like_id
  end
end
