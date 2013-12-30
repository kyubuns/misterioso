class MasterCardLineup < ActiveRecord::Base

  validates :name,        presence: true, uniqueness: { scope: :card_code }
  validates :card_code,   presence: true, numericality: true
  validates :probability, presence: true, numericality: true

  def self.get(name)
    queues = {}
    MasterCardLineup.where('name = ?', name).map{ |lineup| queues[lineup.card_code] = lineup.probability }
    WeightedRandomizer.new(queues).sample
  end

  private
  def self.get_total_probability(name)
    MasterCardLineup.where('name = ?', name).sum(:probability)
  end
end
