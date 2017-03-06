class Book < ApplicationRecord
  has_many :users, through: :borrow_books
  has_many :borrow_books

  validates :title, uniqueness: true, presence:true
  validates :author, presence:true
end
