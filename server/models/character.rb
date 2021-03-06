class Character < ActiveRecord::Base

  belongs_to :user
  has_many   :cards,          dependent: :destroy, autosave: true

  validates  :name,           presence: true
  validates  :ap,             presence: true, numericality: true
  validates  :max_ap,         presence: true, numericality: true
  validates  :ap_recorded_at, presence: true
  validates  :money,          presence: true, numericality: true
  validates  :power,          presence: true, numericality: true

  # AP
  def ap=(value)
    raise OperationError, "not enough ap" if value < 0
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

  def calc_power
    self.cards.map{ |card| card.master_card }.compact.inject(0){ |sum, master_card| sum + master_card.rarity**4 }
  end

  # ranking
  def money_rank
    Character.where('money > ?', self.money).count + 1
  end

  def power_rank
    Character.where('power > ?', self.power).count + 1
  end

  # action
  def work(save = true)
    self.ap = self.ap - 3
    self.money += Random.rand 500
    save! if save
  end

  def die
    User.transaction do
      work(false) until self.ap < 3
      save!
    end
  end

  def gacha(save = true)
    price = 300 #テキトー
    raise OperationError, "not enough money" if self.money < price
    self.money -= price
    add_card MasterCardLineup.get('normal_gacha')
    save! if save
  end

  def numa
    User.transaction do
      gacha(false) until self.money < 300
      save!
    end
  end

  def delete_card(id)
    cards.delete(cards.find(id))
    self.power = calc_power
  end

  def ohuro(save = true)
    ids = not_equipping_card_ids
    raise OperationError, "not enough card" if ids.count < 1
    delete_card(ids.shuffle[0])
    self.max_ap += 1
    self.ap += 1
    save! if save
  end

  def nagaburo
    User.transaction do
      ohuro(false) until self.not_equipping_card_ids.count < 1
      save!
    end
  end

  def not_equipping_card_ids
    ids = self.cards.map{ |card| card.id }
    ids.delete(self.equip_card.id) if self.equip_card
    ids
  end

  def equip(id)
    card = self.cards.find_by_id(id)
    raise OperationError, "don't have the card" if card == nil
    self.equip_card_id = card.id
    save!
  end

  def purge
    self.equip_card_id = nil
    save!
  end

  def osaisen
    price = 1000 #テキトー
    raise OperationError, "not enough money" if self.money < price
    self.money -= price
    reward = Jinja.osaisen price
    add_card reward if reward != nil
    save!
  end

  private
  def add_card(code)
    card = cards.create!( master_card_code: code )
    self.power = calc_power
    card
  end
end
