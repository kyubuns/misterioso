class CreateMasterCardLineups < ActiveRecord::Migration
  def change
    create_table :master_card_lineups do |t|
      t.string   :name,        null: false
      t.integer  :card_code,   null: false
      t.integer  :probability, null: false
      t.timestamps
    end
  end
end
