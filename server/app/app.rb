module Server
  class App < Padrino::Application
    register OmniauthInitializer
    use ActiveRecord::ConnectionAdapters::ConnectionManagement
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    register CompassInitializer

    register Padrino::Admin::AccessControl
    set :admin_model, 'User'

    enable :authentication
    enable :store_location

    enable :sessions

    access_control.roles_for :any do |role|
      role.protect "/home"
    end

    access_control.roles_for :members do |role|
      role.allow "/home"
    end

    get :auth, :map => '/auth/:provider/callback' do
      auth = request.env["omniauth.auth"]
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      set_current_account(user)
      redirect url_for(:base, :home)
    end
  end
end
