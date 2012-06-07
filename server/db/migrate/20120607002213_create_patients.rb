class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.string :dni
      t.date :birthdate
      t.integer :blood_id
      t.string :historical_id

      t.timestamps
    end
  end
end
