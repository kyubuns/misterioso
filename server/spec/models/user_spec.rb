require 'spec_helper'

describe User do
  describe "#create" do
    it "login by twitter" do
      auth = {
        'uid' => '123',
        'provider' => 'twitter',
        'info' => {
          'name' => 'きゅぶんず',
          'nickname' => 'kyubuns'
        }
      }
      user = User.create_with_omniauth auth
      user.uid.should         == '123'
      user.provider.should    == 'twitter'
      user.provider_id.should == 'kyubuns'
      user.role.should        == 'members'

      user.character.name.should == 'きゅぶんず'
    end
  end
end
