class UsersController < ApplicationController
  def index
    @books = current_user.books
  end

  def show
    @user = current_user
  end
end
