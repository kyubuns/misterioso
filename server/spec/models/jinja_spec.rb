require 'spec_helper'

describe Jinja do
  describe "#osaisen" do
    before(:each) {
      Jinja.create money: 0, grade: 0
      MasterCardLineup.create(name: 'jinja', card_code: 1, probability:  1)
    }

    it "1000 yen" do
      Jinja.osaisen(1000)
      Jinja.nokori.should == Jinja::TARGET_MONEY - 1000
    end

    it "1000 yen * 2" do
      Jinja.osaisen(1000)
      Jinja.nokori.should == Jinja::TARGET_MONEY - 1000

      Jinja.osaisen(1000)
      Jinja.nokori.should == Jinja::TARGET_MONEY - 2000
    end

    it "TARGET_MONEY+1000 yen, reset money" do
      Jinja.osaisen(Jinja::TARGET_MONEY + 1000)
      Jinja.nokori.should == Jinja::TARGET_MONEY
    end

    it "can't get reward if don't reach TARGET_MONEY" do
      Jinja.osaisen(Jinja::TARGET_MONEY - 1000).should == nil
    end

    it "get reward if reach TARGET_MONEY" do
      Jinja.osaisen(Jinja::TARGET_MONEY).should_not == nil
    end

    it "grade up jinja if reach TARGET_MONEY" do
      Jinja.osaisen(Jinja::TARGET_MONEY + 1000)
      Jinja.first.grade.should == 1
      Jinja.osaisen(Jinja::TARGET_MONEY + 1000)
      Jinja.first.grade.should == 2
    end
  end
end
