class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :notified_by, foreign_key: true
      t.references :article, foreign_key: true
      t.string :notified_type
      t.boolean :read

      t.timestamps
    end
  end
end
