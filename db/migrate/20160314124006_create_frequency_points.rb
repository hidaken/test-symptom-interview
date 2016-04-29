class CreateFrequencyPoints < ActiveRecord::Migration
  def change
    create_table :frequency_points do |t|
      t.references :disease
      t.integer :department_id
      t.integer :point, null: false, default: 1
      t.timestamps null: false
    end
  end
end
