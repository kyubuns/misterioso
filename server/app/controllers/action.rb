Server::App.controllers :action do
  def protect(*args)
    condition {
      unless current_account && current_account.character
        halt 403, "Not Authorized"
      end
    }
  end

  get :logout, :map => "/logout", :protect => true do
    set_current_account(nil)
    redirect url("/")
  end

  get :work, :map => "/work", :protect => true do
    begin
      current_account.character.work
    rescue OperationError
    end
    redirect url("/mypage")
  end

  get :die, :map => "/die", :protect => true do
    begin
      current_account.character.die
    rescue OperationError
    end
    redirect url("/mypage")
  end

  get :gacha, :map => "/gacha", :protect => true do
    begin
      current_account.character.gacha
    rescue OperationError
    end
    redirect url("/mypage")
  end

  get :numa, :map => "/numa", :protect => true do
    begin
      current_account.character.numa
    rescue OperationError
    end
    redirect url("/mypage")
  end

  get :ohuro, :map => "/ohuro", :protect => true do
    begin
      current_account.character.ohuro
    rescue OperationError
    end
    redirect url("/mypage")
  end

  get :nagaburo, :map => "/nagaburo", :protect => true do
    begin
      current_account.character.nagaburo
    rescue OperationError
    end
    redirect url("/mypage")
  end

  get :equip, :map => "/equip/:id", :protect => true do
    begin
      current_account.character.equip params[:id]
    rescue OperationError
    end
    redirect url("/mypage")
  end

  get :purge, :map => "/purge", :protect => true do
    begin
      current_account.character.purge
    rescue OperationError
    end
    redirect url("/mypage")
  end

  get :osaisen, :map => "/osaisen", :protect => true do
    begin
      current_account.character.osaisen
    rescue OperationError
    end
    redirect url("/mypage")
  end
end
