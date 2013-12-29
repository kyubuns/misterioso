class Character < ActiveRecord::Base

  belongs_to :user

  validates :name,           presence: true
  validates :ap,             presence: true, numericality: true
  validates :max_ap,         presence: true, numericality: true
  validates :ap_recorded_at, presence: true

  #AP
  def ap=(value)
    raise "not enough ap" if value < 0
    value = max_ap if value > max_ap
    write_attribute(:ap, value)
    write_attribute(:ap_recorded_at, Time.now)
  end
end
