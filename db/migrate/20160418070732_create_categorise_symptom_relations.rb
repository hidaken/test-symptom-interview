class CreateCategoriseSymptomRelations < ActiveRecord::Migration
  def change
    create_table :categorise_symptom_relations do |t|
      t.references :categorise, index: true
      t.references :symptom, index: true

      t.timestamps null: false
    end
  end
end
