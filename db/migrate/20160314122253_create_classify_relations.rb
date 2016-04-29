class CreateClassifyRelations < ActiveRecord::Migration
  def change
    create_table :classify_relations do |t|
      t.references :disease, index: true
      t.references :disease_classify, index: true
      
      t.timestamps null: false
      
      t.index [:disease_id, :disease_classify_id], unique: true
    end
  end
end
