class CalcPowerToAllCharacters < ActiveRecord::Migration
  def self.up
    Character.all.each do |character|
      character.calc_power
      character.save!
    end
  end
end
