class RemoveArticleFromNotification < ActiveRecord::Migration[5.2]
  def change
    remove_reference :notifications, :article, foreign_key: true
  end
end
