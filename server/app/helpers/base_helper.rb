
Server::App.helpers do
  def online_characters
    Character.where('updated_at > ?', Time.now - 10.minutes)
  end
end
