class AddLiveIdToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :live_id, :integer
  end
end
