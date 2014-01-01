require 'forgery'

FactoryGirl.define do
  factory :user do
    uid            Forgery::Basic.number
    provider       Forgery::Name.company_name
    provider_id    Forgery::Name.full_name
    role           "members"
  end
end
