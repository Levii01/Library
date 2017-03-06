



class Book < ApplicationRecord
  validates :name, uniqueness: true, presence:true
  validates :author, presence:true
end
