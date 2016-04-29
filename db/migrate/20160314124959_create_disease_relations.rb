class CreateDiseaseRelations < ActiveRecord::Migration
  def change
    create_table :disease_relations do |t|
      t.references :disease_from, index: true
      t.references :disease_to, index: true
      t.integer :relation_type, null: false
      t.integer :point, null: false

      t.timestamps null: false
    end
  end
end
