Server::App.helpers do
  # TODO: ここの定数別ファイルに出したい
  EQUIPMENT_COLOR_TABLE = {
    1 => 'black',
    2 => 'orange',
    3 => 'forestgreenq',
    4 => 'blue',
    5 => 'red',
  }
  EQUIPMENT_COLOR_DEFAULT = 'gray'
  EQUIPMENT_COLOR_NOCARD = 'black'

  def online_characters
    Character.where('updated_at > ?', Time.now - 10.minutes)
  end

  def equipment_name(character)
    return '(なし)' if character.equip_card == nil
    "#{character.equip_card.master_card.name}"
  end

  def equipment_color(character)
    if character.equip_card
      EQUIPMENT_COLOR_TABLE[character.equip_card.master_card.rarity] || EQUIPMENT_COLOR_DEFAULT
    else
      EQUIPMENT_COLOR_NOCARD
    end
  end
end
