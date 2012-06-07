class CreateSicks < ActiveRecord::Migration
  def change
    create_table :sicks do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
