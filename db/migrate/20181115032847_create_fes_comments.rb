class CreateFesComments < ActiveRecord::Migration[5.2]
  def change
    create_table :fes_comments do |t|
      t.text :contents
      t.integer :user_id
      t.integer :fes_id

      t.timestamps
    end
  end
end
