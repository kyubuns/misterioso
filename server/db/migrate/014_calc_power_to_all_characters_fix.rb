class CalcPowerToAllCharactersFix < ActiveRecord::Migration
  def self.up
    Character.all.each do |character|
      character.power = character.calc_power
      character.save!
    end
  end
end
