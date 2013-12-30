require 'spec_helper'

describe MasterCardLineup do
  describe "#get_random" do
      before(:each) {
        MasterCardLineup.create(name: 'normal_gacha', card_code: 1, probability: 10)
        MasterCardLineup.create(name: 'normal_gacha', card_code: 2, probability: 10)
        MasterCardLineup.create(name: 'normal_gacha', card_code: 3, probability: 10)
        MasterCardLineup.create(name: 'normal_gacha', card_code: 4, probability: 10)
        MasterCardLineup.create(name: 'normal_gacha', card_code: 5, probability: 10)
        MasterCardLineup.create(name: 'rare_gacha', card_code: 100, probability: 10)
        MasterCardLineup.create(name: 'rare_gacha', card_code: 101, probability: 10)
        MasterCardLineup.create(name: 'rare_gacha', card_code: 102, probability: 10)
        MasterCardLineup.create(name: 'rare_gacha', card_code: 103, probability: 10)
        MasterCardLineup.create(name: 'rare_gacha', card_code: 104, probability: 1)
      }

      it "get normal_gacha total_probability" do
        MasterCardLineup.send(:get_total_probability, 'normal_gacha').should == 50
      end

      it "get rare_gacha total_probability" do
        MasterCardLineup.send(:get_total_probability, 'rare_gacha').should == 41
      end

      it "get normal_gacha" do
        10.times do
          card_code = MasterCardLineup.get('normal_gacha')
          card_code.should be_between(1, 5)
        end
      end

      it "get rare_gacha" do
        10.times do
          card_code = MasterCardLineup.get('rare_gacha')
          card_code.should be_between(100, 104)
        end
      end
  end
end
