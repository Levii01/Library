FactoryGirl.define do
  factory :book do
    sequence :title do |n|
      "#{Faker::Book.title}#{n}"
    end
    grade { Faker::Book.genre }
    author { Faker::Book.author }
    description { Faker::Lorem.paragraph }
  end
end
