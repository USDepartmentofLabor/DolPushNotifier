class RenameTechUpdatesToTechbits < ActiveRecord::Migration[5.1]
  def change
    rename_table :techupdates, :techbits
  end
end
