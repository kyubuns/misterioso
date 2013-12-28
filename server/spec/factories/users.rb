FactoryGirl.define do
  factory :user do
    uid "1"
    name "test"
    provider "unknown"
    provider_id "name"
    role "members"
  end
end
