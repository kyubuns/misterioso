class AddMoneyToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :money, :integer, null: false
  end
end
