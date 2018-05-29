class AddActiveToTechupdates < ActiveRecord::Migration[5.1]
  def change
    add_column :techupdates, :active, :boolean
  end
end
