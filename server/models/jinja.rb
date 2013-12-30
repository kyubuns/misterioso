class Jinja < ActiveRecord::Base

  validates :money, presence: true, numericality: true
  validates :grade, presence: true, numericality: true

  TARGET_MONEY = 10000

  def self.osaisen(price)
    jinja = Jinja.first
    jinja.money += price

    reward = nil
    if jinja.money >= TARGET_MONEY
      jinja.grade_up
      reward = get_random_card_id
    end

    jinja.save!
    reward
  end

  def self.nokori
    jinja = Jinja.first
    TARGET_MONEY - jinja.money
  end

  def grade_up
    self.money = 0
    self.grade += 1
  end

  def self.get_random_card_id
    # TODO; 200~213 この値もどこか外部にだしたい
    Random.rand(14)+200
  end
end
