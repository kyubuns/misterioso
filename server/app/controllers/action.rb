Server::App.controllers :action do
  def protect(*args)
    condition {
      unless current_account && current_account.character
        halt 403, "Not Authorized"
      end
    }
  end

  get :work, :map => "/work", :protect => true do
    current_account.character.work
    redirect url("/mypage")
  end

  get :gacha, :map => "/gacha", :protect => true do
    current_account.character.gacha
    redirect url("/mypage")
  end

  get :ohuro, :map => "/ohuro", :protect => true do
    current_account.character.ohuro
    redirect url("/mypage")
  end

  get :equip, :map => "/equip/:id", :protect => true do
    current_account.character.equip params[:id]
    redirect url("/mypage")
  end

  get :osaisen, :map => "/osaisen", :protect => true do
    current_account.character.osaisen
    redirect url("/mypage")
  end
end
