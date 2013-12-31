module OmniauthInitializer
  def self.registered(app)
    app.use OmniAuth::Builder do
      provider :developer unless Padrino.env == :production
      provider :twitter, 'consumer_key', 'consumer_secret'
    end

  end
end
