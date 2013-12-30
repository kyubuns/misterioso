class MasterCardLineup < ActiveRecord::Base

  validates :code,        presence: true, uniqueness: { scope: :card_code }
  validates :card_code,   presence: true, numericality: true
  validates :probability, presence: true, numericality: true

end
