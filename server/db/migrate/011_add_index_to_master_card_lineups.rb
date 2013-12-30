class AddIndexToMasterCardLineups < ActiveRecord::Migration
  def change
    add_index :master_card_lineups, :name
    add_index :master_card_lineups, :probability
  end
end
