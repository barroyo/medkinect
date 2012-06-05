class CreateSpecialismships < ActiveRecord::Migration
  def change
    create_table :specialismships do |t|
      t.integer :user_id
      t.integer :specialism_id

      t.timestamps
    end
  end
end
