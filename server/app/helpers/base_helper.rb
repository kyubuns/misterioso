Server::App.helpers do
  def online_characters
    Character.where('updated_at > ?', Time.now - 10.minutes)
  end

  def equipment_name(character)
    return '(なし)' if character.equip_card == nil
    "#{character.equip_card.master_card.name}"
  end

  def equipment_color(character)
    return 'black' if character.equip_card == nil
    return 'black' if character.equip_card.master_card.name != '南ことり'
    return 'red'
  end
end
