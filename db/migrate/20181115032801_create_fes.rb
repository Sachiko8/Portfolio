class CreateFes < ActiveRecord::Migration[5.2]
  def change
    create_table :fes do |t|
      t.string :fes_name
      t.integer :place_id
      t.datetime :fes_day

      t.timestamps
    end
  end
end
