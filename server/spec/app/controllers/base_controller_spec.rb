require 'spec_helper'

describe "BaseController" do
  context "get /" do
    before do
      get "/"
    end

    it { last_response.status.should be_true }
  end

  context "get /mypage" do
    before do
      get "/mypage"
    end

    it { last_response.status.should be_true }
  end
end
