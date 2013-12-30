class Character < ActiveRecord::Base

  belongs_to :user
  has_many   :cards,          dependent: :destroy, autosave: true

  validates  :name,           presence: true
  validates  :ap,             presence: true, numericality: true
  validates  :max_ap,         presence: true, numericality: true
  validates  :ap_recorded_at, presence: true
  validates  :money,          presence: true, numericality: true

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

  def equip_card
    return nil if equip_card_id == nil
    self.cards.find_by_id(equip_card_id)
  end

  # ranking
  def money_rank
    Character.where('money > ?', self.money).count + 1
  end

  # action
  def work
    self.ap = self.ap - 3
    self.money += Random.rand 500
    save!
  end

  def gacha
    price = 300 #テキトー
    raise "not enough money" if self.money < price
    self.money -= price
    if Random.rand(1000) == 50
      # 1/1000の確率でことりちゃんがでる
      # ちゅんちゅん
      add_card(100)
    else
      add_card(Random.rand(50)+1)
    end
    save!
  end

  def delete_card(id)
    cards.delete(cards.find(id))
  end

  def ohuro
    ids = not_equipping_card_ids
    raise "not enough card" if ids.count < 1
    delete_card(ids.shuffle[0])
    self.max_ap += 1
    self.ap += 1
    save!
  end

  def not_equipping_card_ids
    ids = self.cards.map{ |card| card.id }
    ids.delete(self.equip_card.id) if self.equip_card
    ids
  end

  def equip(id)
    card = self.cards.find_by_id(id)
    raise "don't have the card" if card == nil
    self.equip_card_id = card.id
    save!
  end

  def osaisen
    price = 1000 #テキトー
    raise "not enough money" if self.money < price
    self.money -= price
    reward = Jinja.osaisen price
    add_card reward if reward != nil
    save!
  end

  private
  def add_card(code)
    cards.create!({
      master_card_code: code
    })
  end
end
