class CreateIntegration < ActiveRecord::Migration
  def change
    create_table :integrations do |t|
      t.integer :user_id
      t.string :provider
      t.string :provider_uid
      t.text :token
      t.text :secret

      t.timestamps
    end
  end
end
