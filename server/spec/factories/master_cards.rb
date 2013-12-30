require 'forgery'

FactoryGirl.define do
  factory :master_card do
    sequence(:code)
    name   Forgery::Name.full_name
    rarity Forgery::Basic.number(at_least: 1, at_most: 5)
  end
end
