class CreateSpecialisms < ActiveRecord::Migration
  def change
    create_table :specialisms do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
