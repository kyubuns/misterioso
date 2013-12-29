require 'forgery'

FactoryGirl.define do
  factory :user do
    uid         Forgery::Name.full_name
    provider    Forgery::Name.company_name
    provider_id Forgery::Name.full_name
    role        "members"

    name        Forgery::Name.full_name
    ap          Forgery::Basic.number, at_least: 0, at_most: 100
  end
end
