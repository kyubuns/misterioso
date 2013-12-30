class AddPowerToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :power, :integer, null: false
  end
end
