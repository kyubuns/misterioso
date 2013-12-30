class Card < ActiveRecord::Base

  belongs_to :character
  belongs_to :master_card, primary_key: 'code', foreign_key: 'master_card_code'

  validates  :character_id,     presence: true, numericality: true
  validates  :master_card_code, presence: true, numericality: true

end
