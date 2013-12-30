class AddRarityToMasterCards < ActiveRecord::Migration
  def change
    add_column :master_cards, :rarity, :integer
  end
end
