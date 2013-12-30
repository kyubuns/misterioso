class CreateJinjas < ActiveRecord::Migration
  def self.up
    create_table :jinjas do |t|
      t.integer :money, null: false
      t.integer :grade, null: false
      t.timestamps
    end

    Jinja.create money: 0, grade: 0
  end

  def self.down
    drop_table :jinjas
  end
end
