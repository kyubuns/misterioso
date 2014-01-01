require 'spec_helper'

describe User do
  describe "#create" do
    let(:auth_user){ FactoryGirl.build(:user) }
    let(:uid) { auth_user.uid }
    let(:provider) { auth_user.provider }
    let(:provider_id) { auth_user.provider_id }
    let(:role) { auth_user.role }
    let(:username) { Forgery::Basic.text }
    let(:auth) {
      { 
        'uid' => auth_user.uid,
        'provider' => auth_user.provider,
        'info' => {
          'name' => username,
          'nickname' => provider_id
        }
      }
    }
    let(:user) { User.create_with_omniauth auth }

    it "login by twitter" do
      user.uid.should         eq uid
      user.provider.should    eq provider
      user.provider_id.should eq provider_id
      user.role.should        eq role

      user.character.name.should eq username
      user.character.save!
    end
  end
end
