class CreateSickships < ActiveRecord::Migration
  def change
    create_table :sickships do |t|
      t.integer :patient_id
      t.integer :sick_id
      t.datetime :diagnostic_date

      t.timestamps
    end
  end
end
