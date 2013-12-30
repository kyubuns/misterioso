class CreateCards < ActiveRecord::Migration
  def change
    create_table :master_cards do |t|
      t.integer  :code, null: false, unique: true
      t.string   :name, null: false
    end

    create_table :cards do |t|
      t.integer  :character_id,     null: false
      t.integer  :master_card_code, null: false
      t.timestamps
    end
  end
end
