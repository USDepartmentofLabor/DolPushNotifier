class ChangeActiveDefaultToFalse < ActiveRecord::Migration[5.1]
  def change
    change_column :techbits, :active, :boolean, default: false
  end
end
