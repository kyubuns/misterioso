class MasterCard < ActiveRecord::Base

  validates  :code,   presence: true
  validates  :name,   presence: true
  validates  :rarity, presence: true, numericality: true, inclusion: { in: 1..5 }

end
