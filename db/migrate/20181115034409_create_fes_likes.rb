class CreateFesLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :fes_likes do |t|
      t.integer :user_id
      t.integer :fes_id

      t.timestamps
    end
  end
end
