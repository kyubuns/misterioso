require 'forgery'

FactoryGirl.define do
  factory :master_card do
    sequence(:code)
    name Forgery::Name.full_name
  end
end
