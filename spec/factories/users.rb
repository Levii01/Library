FactoryGirl.define do
  factory :user do
    sequence :email do |n|
    "user#{n}@gmail.com"
    end
    password "secret"
  end
end
