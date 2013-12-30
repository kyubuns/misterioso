class AddIndexToMasterCardLineups < ActiveRecord::Migration
  def change
    add_index :master_card_lineups, :name
  end
end
