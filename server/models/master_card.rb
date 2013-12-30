class MasterCard < ActiveRecord::Base

  validates  :code, presence: true
  validates  :name, presence: true

end
