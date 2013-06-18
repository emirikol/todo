FactoryGirl.define do
  sequence(:email) {|n| "a#{n}@b.com" }

  factory :user do
    email { generate(:email) }
  end
end