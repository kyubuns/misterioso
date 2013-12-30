require 'spec_helper'

describe Character do
  describe "#ap" do
    describe "update ap_recorded_at when operate ap" do
      let(:character) { FactoryGirl.create :character, max_ap: 10, ap: 5 }
      let(:now) { Time.local 2013,12,29,12,0,0 }
      before(:each) {
        Time.stub(:now).and_return now
        character.ap = 5
      }

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

    describe "recover ap" do
      let(:character) { FactoryGirl.create :character, max_ap: 10, ap: 5 }
      let(:now) { Time.local 2013,12,29,12,0,0 }
      before(:each) { Time.stub(:now).and_return now }

      it "1 point / 2 minute" do
        character.ap = 0

        Time.stub(:now).and_return now + 6.minutes
        character.ap.should == 3
      end

      it "don't over max_ap" do
        character.ap = 0

        Time.stub(:now).and_return now + 2.days
        character.ap.should == 10
      end
    end
  end

  describe "#work" do
    let(:character) { FactoryGirl.create :character, max_ap: 10, ap: 10, money:0 }

    it "use 3 ap when work" do
      expect { character.work }.to change { character.ap }.from(10).to(7)
    end

    it "raise error when not enough ap" do
      character.ap = 1
      expect { character.work }.to raise_error
    end

    it "get money!" do
      Random.stub(:rand).and_return 100
      expect { character.work }.to change { character.money }.from(0).to(100)
    end
  end

  describe "#money_ranking" do
    let(:character1) { FactoryGirl.create :character, money:100 }
    let(:character2) { FactoryGirl.create :character, money:200 }
    let(:character3) { FactoryGirl.create :character, money:300 }
    let(:character4) { FactoryGirl.create :character, money:400 }

    it "ranking" do
      character1.money_rank == 1
      character2.money_rank == 2
      character3.money_rank == 3
      character4.money_rank == 4
    end
  end
end
