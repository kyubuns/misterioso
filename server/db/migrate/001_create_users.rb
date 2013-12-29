class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid,         null: false
      t.string :name,        null: false
      t.string :provider,    null: false
      t.string :provider_id, null: false
      t.string :role,        null: false
      t.timestamps
    end
  end
end
