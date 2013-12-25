Server::App.controllers :base do
	get :index, :map => "/" do
		redirect url("/home") if current_account
		render "base/index"
	end

	get :home, :map => "/home" do
		"Provider: #{current_account.provider}, uid: #{current_account.uid}"
	end
end
