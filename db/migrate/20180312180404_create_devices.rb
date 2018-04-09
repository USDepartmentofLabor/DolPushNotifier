class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :device_tokens do |t|
      t.string :token
      t.string :new_token
      t.integer :app_id
      t.timestamps
    end
  end
end
