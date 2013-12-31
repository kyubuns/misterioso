class PresentOiwaiWakuForAllCharacters < ActiveRecord::Migration
  def self.up
    Character.all.each do |character|
      character.send(:add_card, 1000)
      character.save!
    end
  end
end
