class Card < ActiveRecord::Base

  belongs_to :character
  belongs_to :master_card, primary_key: 'code', foreign_key: 'master_card_code'

end
