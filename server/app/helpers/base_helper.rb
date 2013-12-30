Server::App.helpers do
  def online_characters
    Character.where('updated_at > ?', Time.now - 10.minutes)
  end

  def equipment_name(character)
    return '(なし)' if character.equip_card == nil
    "#{character.equip_card.master_card.name}"
  end

  def equipment_color(character)
    # TODO: 綺麗に書けそう
    return 'black'        if character.equip_card == nil
    return 'black'        if character.equip_card.master_card.rarity == 1
    return 'orange'       if character.equip_card.master_card.rarity == 2
    return 'forestgreenq' if character.equip_card.master_card.rarity == 3
    return 'blue'         if character.equip_card.master_card.rarity == 4
    return 'red'          if character.equip_card.master_card.rarity == 5
    return 'gray'
  end
end
