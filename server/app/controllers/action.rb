Server::App.controllers :action do
  def protect
    condition {
      unless current_account && current_account.character
        halt 403, "Not Authorized"
      end
    }
  end

  get :work, :map => "/work" do
    current_account.character.work
    redirect url("/mypage")
  end

  get :gacha, :map => "/gacha" do
    current_account.character.gacha
    redirect url("/mypage")
  end

  get :ohuro, :map => "/ohuro" do
    current_account.character.ohuro
    redirect url("/mypage")
  end

  get :equip, :map => "/equip/:id" do
    current_account.character.equip params[:id]
    redirect url("/mypage")
  end
end
