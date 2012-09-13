class RemoveUserIdFromRoles < ActiveRecord::Migration
  def up
    remove_column :roles, :user_id
      end

  def down
    add_column :roles, :user_id, :integer
  end
end
