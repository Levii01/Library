FactoryGirl.define do
  factory :user do
    sequence :name do |n|
    "User#{n}"
    end
    sequence :email do |n|
    "user#{n}@gmail.com"
    end
    password "secret"
  end
end
