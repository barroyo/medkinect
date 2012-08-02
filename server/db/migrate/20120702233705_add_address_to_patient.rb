class AddAddressToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :address, :text

  end
end
