class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
      t.string :description
      t.string :e
      t.string :access

      t.timestamps
    end
  end
end
