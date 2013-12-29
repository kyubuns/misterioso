class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string   :name,           null: false
      t.integer  :ap,             null: false
      t.integer  :max_ap,         null: false
      t.datetime :ap_recorded_at, null: false
      t.timestamps
    end
  end
end
