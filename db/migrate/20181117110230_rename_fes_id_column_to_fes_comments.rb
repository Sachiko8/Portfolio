class RenameFesIdColumnToFesComments < ActiveRecord::Migration[5.2]
  def change
  	rename_column :fes_comments, :fes_id, :fe_id
  end
end
