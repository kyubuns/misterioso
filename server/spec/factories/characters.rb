require 'forgery'

FactoryGirl.define do
  factory :character do
    name           Forgery::Name.full_name
    max_ap         Forgery::Basic.number(at_least: 100, at_most: 200)
    ap             Forgery::Basic.number(at_least: 0, at_most: 100)
    ap_recorded_at Time.now
    money          Forgery::Basic.number(at_least: 0, at_most: 1000)
  end
end
