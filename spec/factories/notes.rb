FactoryGirl.define do
  sequence(:title) {|n| "some title #{n}" }
  sequence(:description) {|n| "some description #{n}" }
  sequence(:due) {|n| DateTime.new + n }

  factory :note do
    title { generate(:title) }
    description { generate(:description) }
    due { generate(:due) }
  end
end