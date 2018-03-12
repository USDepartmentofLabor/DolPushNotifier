class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :original_token
      t.string :new_token
      t.timestamps
    end
  end
end
