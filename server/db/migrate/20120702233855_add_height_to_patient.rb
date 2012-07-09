class AddHeightToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :height, :text

  end
end
