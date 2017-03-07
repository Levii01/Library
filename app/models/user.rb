class User < ApplicationRecord
  has_many :books, -> { where('give_back= ? ', false) }, through: :borrow_books
  has_many :borrow_books

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
