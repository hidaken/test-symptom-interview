class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.integer :login_id
      t.string :password_digest
      t.integer :department_id

      t.timestamps null: false
      
      t.index :login_id, unique: true
      
    end
  end
end
