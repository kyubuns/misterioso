class PresentNengajoForAllCharacters < ActiveRecord::Migration
  def self.up
    Character.all.each do |character|
      character.send(:add_card, 1001)
      character.save!
    end
  end
end
