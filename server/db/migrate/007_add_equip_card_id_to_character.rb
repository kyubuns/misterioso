class AddEquipCardIdToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :equip_card_id, :integer
  end
end
