class BorrowBooksController < ApplicationController
  before_action :authenticate_user!

  def borrow_new
    book = Book.find(params[:id])
    if BorrowBook.exists?(user: current_user, book: book, give_back: false)
      redirect_to books_path, notice: "You haven't given back this book yet "
    else
      BorrowBook.create(user: current_user, book: book)
      redirect_to books_path, notice: "Book #{book.title} has been borrowed"
    end
  end

  def give_back
    book = Book.find(params[:id])
    if BorrowBook.exists?(user: current_user, book: book, give_back: false)
      BorrowBook.find_by(user: current_user, book: book, give_back: false).update!(give_back: true)
      redirect_to my_books_path, notice: "Book #{book.title} has given back"
    else
      redirect_to my_books_path, notice: "You don't have this book"
    end
  end

  def history
    @borrows = BorrowBook.all.reverse
  end
end
