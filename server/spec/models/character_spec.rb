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

  describe "#add_card" do
    let(:master_card) { FactoryGirl.create :master_card, code: 10, name: '南ことり' }
    let(:character)   { FactoryGirl.create :character }
    before(:each) { master_card.save! }

    it "add normal card" do
      card = character.send(:add_card, 10)
      card.save!

      card.character.should == character
      card.master_card.should == master_card

      character.cards.count.should == 1
    end
  end

  describe "#delete_card" do
    let(:master_card1) { FactoryGirl.create :master_card, code: 1, name: 'Nにこ先輩' }
    let(:master_card2) { FactoryGirl.create :master_card, code: 2, name: 'Rにこ先輩' }
    let(:master_card3) { FactoryGirl.create :master_card, code: 3, name: 'URにこ先輩' }
    let(:character)   { FactoryGirl.create :character }
    before(:each) {
      master_card1.save!
      master_card2.save!
      master_card3.save!
      character.send(:add_card, 1)
      character.send(:add_card, 2)
      character.send(:add_card, 3)
    }

    it "first" do
      character.cards.count.should == 3
      character.cards[0].master_card.should == master_card1
      character.cards[1].master_card.should == master_card2
      character.cards[2].master_card.should == master_card3
    end

    it "delete card" do
      delete_id = character.cards[0].id
      character.delete_card delete_id

      character.cards.count.should == 2
      character.cards[0].master_card.should == master_card2
      character.cards[1].master_card.should == master_card3
    end
  end

  describe "#normal gacha" do
    let(:character)   { FactoryGirl.create :character, money: 1000 }
    before(:each) {
      MasterCardLineup.create(name: 'normal_gacha', card_code: 1, probability:  1)
    }

    it "use money" do
      expect { character.gacha }.to change { character.money }.from(1000).to(700)
    end

    it "get new card" do
      expect { character.gacha }.to change { character.cards.count }.from(0).to(1)
    end

    it "raise error, not enough money" do
      character.money = 100
      expect { character.gacha }.to raise_error
    end
  end

  describe "#ohuro" do
    let(:character)   { FactoryGirl.create :character, ap: 0, max_ap: 10 }
    let(:master_card) { FactoryGirl.create :master_card, code: 1, name: 'naota' }
    before(:each) { character.send(:add_card, 1) }

    it "max_ap 1up!" do
      expect { character.ohuro }.to change { character.max_ap }.from(10).to(11)
    end

    it "restore 1 ap" do
      expect { character.ohuro }.to change { character.ap }.from(0).to(1)
    end

    it "use 1 card" do
      expect { character.ohuro }.to change { character.cards.count }.from(1).to(0)
    end

    it "don't use equipping card" do
      character.send(:add_card, 1)
      character.cards.count.should == 2

      character.equip(1)
      expect { character.ohuro }.to change { character.cards.count }.from(2).to(1)
      expect { character.ohuro }.to raise_error
    end

    it "raise error, not enough card" do
      character.ohuro
      expect { character.ohuro }.to raise_error
    end
  end

  describe "#equip_card" do
    let(:character)   { FactoryGirl.create :character, ap: 0, max_ap: 10 }
    let(:master_card) { FactoryGirl.create :master_card, code: 1, name: 'naota' }
    before(:each) { character.send(:add_card, 1) }

    it "equip card" do
      item_id = character.cards[0].id
      expect { character.equip(item_id) }.to change { character.equip_card_id }.from(nil).to(item_id)
      character.equip_card.master_card == master_card
    end

    it "can't equip card if dummy id" do
      dummy_id = 100
      expect { character.equip(dummy_id) }.to raise_error
    end

    it "no equip when delete equipping card" do
      character.equip_card_id = 100
      character.equip_card.should == nil
    end
  end

  describe "#osaisen" do
    let(:character)   { FactoryGirl.create :character, money: 10000 }
    before(:each) {
      Jinja.create money: 0, grade: 0
      MasterCardLineup.create(name: 'jinja', card_code: 1, probability:  1)
    }

    it "use money" do
      expect { character.osaisen }.to change { character.money }.by(-1000)
    end

    it "get new card" do
      Jinja.osaisen Jinja::TARGET_MONEY-500
      Jinja.nokori.should == 500
      expect { character.osaisen }.to change { character.cards.count }.by(1)
    end

    it "raise error, not enough money" do
      character.money = 100
      expect { character.osaisen }.to raise_error
    end
  end

  describe "#power" do
    let(:character)   { FactoryGirl.create :character }
    let(:master_card1) { FactoryGirl.create :master_card, code: 1, rarity: 1 }
    let(:master_card2) { FactoryGirl.create :master_card, code: 2, rarity: 3 }
    let(:master_card3) { FactoryGirl.create :master_card, code: 3, rarity: 5 }
    before(:each) {
      master_card1.save!
      master_card2.save!
      master_card3.save!
    }

    it "no card, no power" do
      character.power.should == 0
    end

    it "rarity 1 card has 1**4 = 1 power" do
      character.send(:add_card, 1)
      character.power.should == 1

      character.send(:add_card, 1)
      character.power.should == 2
    end

    it "rarity 3 card has 3**4 = 81 power" do
      character.send(:add_card, 2)
      character.power.should == 81

      character.send(:add_card, 2)
      character.power.should == 81 * 2
    end

    it "rarity 3 card has 5**4 = 625 power" do
      character.send(:add_card, 3)
      character.power.should == 625

      character.send(:add_card, 3)
      character.power.should == 625 * 2
    end
  end
end
