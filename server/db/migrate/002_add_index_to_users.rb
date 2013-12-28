class AddIndexToUsers < ActiveRecord::Migration
  def self.change
		add_index "users", ["uid", "provider"], :unique => true
  end
end
