class AddProviderIdFieldsToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :provider_id
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :provider_id
    end
  end
end
