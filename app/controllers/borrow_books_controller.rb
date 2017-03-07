class BorrowBooksController < ApplicationController
  def borrow_new
    book = Book.find(params[:id])
    if BorrowBook.exists?(user: current_user, book: book, give_back: false)
      redirect_to books_path(params[:id]), notice: "You haven't given back this book yet "
    else
      BorrowBook.create(user: current_user, book: book)
      redirect_to books_path(params[:id]), notice: "Book #{book.title} has been borrowed"
    end
  end

  def give_back
    book = Book.find(params[:id])
    if BorrowBook.exists?(user: current_user, book: book, give_back: false)
      BorrowBook.find_by(user: current_user, book: book, give_back: false).update!(give_back: true)
      redirect_to my_books_path(params[:id]), notice: "Book #{book.title} has given back"
    else
      redirect_to my_books_path(params[:id]), notice: "You don't have this book"
    end
  end
end
