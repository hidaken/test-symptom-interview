class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.references :symptom_category, null: false
      t.string :symptom_name, null: false
      t.integer :symptom_flag
      t.string :symptom_text
      t.text :symptom_description
      
      t.timestamps null: false

      t.index [:symptom_name]
    end
  end
end
