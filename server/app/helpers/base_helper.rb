Server::App.helpers do
  def online_characters
    Character.where('updated_at > ?', Time.now - 10.minutes)
  end

  def equipment_name(character)
    return '(なし)' if character.equip_card == nil
    "#{character.equip_card.master_card.name}"
  end

  def equipment_color(character)
    return 'black' unless character.equip_card

    case character.equip_card.master_card.rarity
      when 1 then 'black'
      when 2 then 'orange'
      when 3 then 'forestgreen'
      when 4 then 'blue'
      when 5 then 'gray'
      else 'gray'
    end
  end
end
