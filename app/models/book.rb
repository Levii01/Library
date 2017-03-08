class Book < ApplicationRecord
  has_many :users, through: :user_books
  has_many :user_books, dependent: :destroy

  validates :title, uniqueness: true, presence:true
  validates :author, presence:true
end
