require 'forgery'

FactoryGirl.define do
  factory :character do
    name           Forgery::Name.full_name
    ap             Forgery::Basic.number(at_least: 0, at_most: 100)
    max_ap         Forgery::Basic.number(at_least: 100, at_most: 200)
    ap_recorded_at Time.now
  end
end
