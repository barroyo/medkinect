class RemoveEFromRoles < ActiveRecord::Migration
  def up
    remove_column :roles, :e
      end

  def down
    add_column :roles, :e, :string
  end
end
