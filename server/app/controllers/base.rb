Server::App.controllers :base do
  get :index, :map => "/" do
    render "base/index"
  end

  get :mypage, :map => "/mypage" do
    redirect url("/home") unless current_account
    render "base/mypage"
  end
end
