class AddLiveIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :live_id, :integer
  end
end
