FactoryGirl.define do
  factory :user_book do
    user { FactoryGirl.create(:user) }
    book { FactoryGirl.create(:book) }
    give_back false
  end
end
