require 'spec_helper'

describe "ActionController" do
  context "when not login" do
    let (:redirect) { 403 }
    before do
      get :work
    end
    
    it { last_response.status.should eq redirect } 
  end
end
