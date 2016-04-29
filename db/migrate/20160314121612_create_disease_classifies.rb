class CreateDiseaseClassifies < ActiveRecord::Migration
  def change
    create_table :disease_classifies do |t|
      t.string :classify_name
      

      t.timestamps null: false
    end
  end
end
