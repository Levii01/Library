class BorrowBooksController < ApplicationController
  def borrow_new
    book = Book.find(params[:id])
    if BorrowBook.exists?(user: current_user, book: book, give_back: false)
      redirect_to books_path(params[:id]), notice: "You haven't given back this book yet "
    else
      BorrowBook.create(user: current_user, book: book)
      redirect_to books_path(params[:id]), notice: "Book #{book.title} was rented"
    end
  end
end
