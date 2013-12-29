require 'spec_helper'

describe Character do
  describe "#ap" do
    describe "update ap_recorded_at when operate ap" do
      let(:character) { FactoryGirl.create :character }
      let(:now) { Time.local 2013,12,29,12,0,0 }
      before(:each) { Time.stub(:now).and_return now }

      it "operator =" do
        character.ap = 5

        character.ap.should == 5
        character.ap_recorded_at.should == now
      end

      #TODO: +=, -=
    end
  end
end
