class AddWeightToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :weight, :text

  end
end
