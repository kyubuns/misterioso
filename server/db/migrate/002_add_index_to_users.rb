class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, [:uid, :provider], unique: true
  end
end
