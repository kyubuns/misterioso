class Character < ActiveRecord::Base

  belongs_to :user

  validates :name,           presence: true
  validates :ap,             presence: true, numericality: true
  validates :max_ap,         presence: true, numericality: true
  validates :ap_recorded_at, presence: true

  # AP
  def ap=(value)
    raise "not enough ap" if value < 0
    value = max_ap if value > max_ap
    write_attribute(:ap, value)
    write_attribute(:ap_recorded_at, Time.now)
  end

  def ap
    v = read_attribute(:ap)
    dif = (Time.now.to_time.to_i - ap_recorded_at.to_time.to_i)/60
    [v + dif, max_ap].min
  end

  # action
  def work(value)
    self.ap = self.ap - value
    save!
  end
end
