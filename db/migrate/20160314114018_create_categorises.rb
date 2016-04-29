class CreateCategorises < ActiveRecord::Migration
  def change
    create_table :categorises do |t|
      t.string :categorise_name, null: false
      

      t.timestamps null: false
    end
  end
end
