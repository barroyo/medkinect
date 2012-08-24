class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.integer :user_id
      t.integer :patient_id
      t.date :datetime
      t.string :date_type
      t.text :result
      t.string :status
      t.timestamps
    end
  end
end
