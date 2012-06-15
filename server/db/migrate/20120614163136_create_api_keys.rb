class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.string :version_api

      t.timestamps
    end
  end
end
