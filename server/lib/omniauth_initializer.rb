module OmniauthInitializer
  def self.registered(app)
    app.use OmniAuth::Builder do
      provider :developer unless Padrino.env == :production
      provider :twitter, 'rXHh5HzpHuYfMIjbMVqQ', 'OdhK9lznXhK7BWbIBwJIgcpxbRzWOGtj1bJzBTrqMTs'
    end

  end
end
