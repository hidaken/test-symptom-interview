class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
      t.string :name, null: false
      t.string :onset
      t.integer :localization
      t.integer :importance, default: 0
      t.float :morbidity_baby, null: false, default: 0.25
      t.float :morbidity_child, null: false, default: 0.25
      t.float :morbidity_adult, null: false, default: 0.25
      t.float :morbidity_senior, null: false, default: 0.25
      t.float :morbidity_male, null: false, default: 0.5
      t.float :morbidity_female, null: false, default: 0.5
      t.float :seasonality12to2, null: false, default: 0.25
      t.float :seasonality3to5, null: false, default: 0.25
      t.float :seasonality6to8, null: false, default: 0.25
      t.float :seasonality9to11, null: false, default: 0.25
      t.string :icd10_1
      t.string :icd10_2
      t.text :description

      t.timestamps null: false
      
      t.index [:name], unique: true, name: 'disease_index'
    end
  end
end
