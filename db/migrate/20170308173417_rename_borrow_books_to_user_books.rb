class RenameBorrowBooksToUserBooks < ActiveRecord::Migration[5.0]
  def change
    rename_table :borrow_books, :user_books
  end
end
