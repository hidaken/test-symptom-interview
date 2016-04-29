class CreateOnsets < ActiveRecord::Migration
  def change
    create_table :onsets do |t|
      t.string :onset_name, null: false
      t.string :onset_detail

      t.timestamps null: false
    end
  end
end
