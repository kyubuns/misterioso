class Character < ActiveRecord::Base

  belongs_to :user

  validates :name,           presence: true
  validates :ap,             presence: true, numericality: true
  validates :max_ap,         presence: true, numericality: true
  validates :ap_recorded_at, presence: true
  validates :money,          presence: true, numericality: true

  # AP
  def ap=(value)
    raise "not enough ap" if value < 0
    value = max_ap if value > max_ap
    write_attribute(:ap, value)
    write_attribute(:ap_recorded_at, Time.now)
  end

  def ap
    v = read_attribute(:ap)
    dif = (Time.now.to_time.to_i - ap_recorded_at.to_time.to_i)/120
    [v + dif, max_ap].min
  end

  # action
  def work
    self.ap = self.ap - 3
    self.money += Random.rand 1000
    save!
  end
end
