class AddMobileToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :mobile, :text

  end
end
