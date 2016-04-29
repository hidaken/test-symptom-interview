class CreateLargeCategorises < ActiveRecord::Migration
  def change
    create_table :large_categorises do |t|
      t.integer :large_categorise_id, null: false
      t.string :large_categorise_name
      t.references :categorise

      t.timestamps null: false
    end
  end
end
