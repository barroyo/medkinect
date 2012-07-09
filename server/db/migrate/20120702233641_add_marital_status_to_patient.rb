class AddMaritalStatusToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :marital_status, :string

  end
end
