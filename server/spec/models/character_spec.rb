require 'spec_helper'

describe Character do
  describe "#ap" do
    describe "update ap_recorded_at when operate ap" do
      let(:character) { FactoryGirl.create :character, max_ap: 10, ap: 5 }
      let(:now) { Time.local 2013,12,29,12,0,0 }
      before(:each) { Time.stub(:now).and_return now }

      it "operator =" do
        character.ap = 8

        character.ap.should == 8
        character.ap_recorded_at.should == now
      end

      it "operator +=" do
        character.ap += 3

        character.ap.should == 8
        character.ap_recorded_at.should == now
      end

      it "operator -=" do
        character.ap -= 3

        character.ap.should == 2
        character.ap_recorded_at.should == now
      end
    end

    describe "ap inclusion in [0, max_ap] when operate ap" do
      let(:character) { FactoryGirl.create :character, max_ap: 10, ap: 5 }

      it "ap <= max_ap" do
        character.ap += 10
        character.ap.should == 10
      end

      it "raise error, if ap < 0" do
        expect { character.ap -= 10 }.to raise_error
      end

    end
  end
end
