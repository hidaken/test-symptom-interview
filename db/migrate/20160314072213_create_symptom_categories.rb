class CreateSymptomCategories < ActiveRecord::Migration
  def change
    create_table :symptom_categories do |t|
      t.string :symptom_category_name, null: false

      t.timestamps null: false
    end
  end
end
