class CreateCategoriseDiseaseRelations < ActiveRecord::Migration
  def change
    create_table :categorise_disease_relations do |t|
      t.references :disease, index: true
      t.references :categorise, index: true

      t.timestamps null: false
      t.index [:disease_id, :categorise_id], unique: true, name: "index_disease_categorise"
    end
  end
end
