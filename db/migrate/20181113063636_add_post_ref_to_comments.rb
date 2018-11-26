class AddPostRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :post, foreign_key: true
    add_reference :comments, :parent, foreign_key: true
    add_column :comments, :replies_count, :integer
  end
end
