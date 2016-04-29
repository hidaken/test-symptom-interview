class CreateDiseaseSymptoms < ActiveRecord::Migration
  def change
    create_table :disease_symptoms do |t|
      t.references :disease, index: true
      t.references :symptom, index: true
      t.integer :relation_point
      t.integer :plr
      t.integer :nlr
      t.text :description

      t.timestamps null: false
      t.index [:disease_id, :symptom_id], unique: true

    end
  end
end
