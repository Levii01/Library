require 'rails_helper'

RSpec.describe UserBooksController, type: :controller do
  let(:user) { create :user, email: 'its@me.com' }

  before { sign_in user }

  describe "GET #borrow_new" do
    let(:this_book) { create :book }
    subject { get :borrow_new, params: { id: this_book.id }}
    context "when user borrowing book" do
      it { is_expected.to redirect_to books_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq("Book #{this_book.title} has been borrowed.")
      end
    end

    context "when haven't given back this book yet." do
      let!(:this_book) { create :book, title: 'Fight Club' }
      let!(:first_user_book) { create :user_book, book_id: this_book.id, user_id: user.id, give_back: false }
      subject { post :borrow_new, params: { id: this_book.id }}
      it { is_expected.to redirect_to books_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq("You haven't given back this book yet.")
      end
    end

    context "when want again borrow this book" do
      let!(:this_book) { create :book, title: 'Godfather' }
      let!(:first_user_book) { create :user_book, book_id: this_book.id, user_id: user.id, give_back: true }
      subject { post :borrow_new, params: { id: this_book.id }}
      it { is_expected.to redirect_to books_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq("Book Godfather has been borrowed.")
      end
    end
  end

  describe "GET #give_back" do
    context "when user don't have this book" do
      let!(:this_book) { create :book, title: 'Drizzt' }
      let!(:first_user_book) { create :user_book, book_id: this_book.id, user_id: user.id, give_back: true }
      subject { post :give_back, params: { id: this_book.id }}
      it { is_expected.to redirect_to my_books_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq("You don't have this book.")
      end
    end

    context "when user want to give back book" do
      let!(:this_book) { create :book, title: 'Witcher' }
      let!(:first_user_book) { create :user_book, book_id: this_book.id, user_id: user.id, give_back: false }
      subject { post :give_back, params: { id: this_book.id }}
      it { is_expected.to redirect_to my_books_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq("Book Witcher has given back.")
      end
    end
  end

  describe "create new record" do
    subject { create :user_book }

    it 'borrow book by user' do
      expect{ subject }.to change(UserBook, :count).by(1)
    end
  end

  describe "GET #history" do
    subject { get :history }
    it_behaves_like 'template rendering action', :history

    it "returns http success" do
      get :history
      expect(response).to have_http_status(:success)
    end
  end

end
