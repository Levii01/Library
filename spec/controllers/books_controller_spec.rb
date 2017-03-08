require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:user) { create :user }

  before { sign_in user }

  let(:book) { create :book}
  let(:valid_attributes) { build(:book).attributes }
  let(:invalid_attributes) { {title: nil, author: nil, grade: true} }

  describe "GET #index" do
    subject { get :index }
    it_behaves_like 'template rendering action', :index

    it "assigns all books as @books" do
      subject
      expect(assigns(:books)).to eq([book])
    end
  end

  describe "GET #show" do
    subject { get :show, params: { id: book.id } }
    it_behaves_like 'template rendering action', :show

    it "assigns the requested book as @book" do
      subject
      expect(assigns(:book)).to eq(book)
    end
  end

  describe "GET #new" do
    subject { get :new }
    it_behaves_like 'template rendering action', :new

    it "assigns a new book as @book" do
      subject
      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe "GET #edit" do
    let(:book) { create :book }
    subject { get :edit, params: { id: book.id } }

    it_behaves_like 'template rendering action', :edit
  end

  describe "POST #create" do
    let!(:params) { { book: valid_attributes } }
    subject { post :create, params: params }
    context "with valid params" do
      it { is_expected.to redirect_to book_path(Book.last) }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq('Book was successfully created.')
      end

      it 'creates book' do
        expect{ subject }.to change(Book, :count).by(1)
      end

      it "assigns a newly created book as @book" do
        subject
        expect(assigns(:book)).to be_a(Book)
        expect(assigns(:book)).to be_persisted
      end
    end

    context "with invalid params" do
      include_context 'record save failure'
      it_behaves_like 'template rendering action', :new

      subject { post :create, params: {book: invalid_attributes }}
      it "assigns a newly created but unsaved book as @book" do
        subject
        expect(assigns(:book)).to be_a_new(Book)
      end

      it "re-renders the 'new' template" do
        subject
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let!(:book) { create :book, title: 'The Kegebd of Drizzt', grade: 'fantazy',
      author: 'R. A. Salvatore', description: 'Legend about Elf Drow'}
    let(:title) { 'Wiedźmin' }
    let(:grade) { 'Fantazy' }
    let(:author) { 'Andrzej Sapkowski' }
    let(:description) { 'Awesome books series' }
    let!(:params) do
      { id: book.id, book: { title: title, grade: grade, author: author, description: description } }
    end
    subject { put :update, params: params }

    context "with valid params" do
      it { is_expected.to redirect_to book }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq('Book was successfully updated.')
      end

      context 'when updates book with new attribute' do
        subject { -> { put :update, params: params } }
        it { is_expected.to change{ book.reload.title }.to(title) }
        it { is_expected.to change{ book.reload.grade }.to(grade) }
        it { is_expected.to change{ book.reload.author }.to( author ) }
        it { is_expected.to change{ book.reload.description }.to( description ) }
      end
    end

    context "with invalid params" do
      include_context 'record save failure'
      it_behaves_like 'template rendering action', :edit

      context 'when updates book with invalid attribute' do
        subject { -> { put :update, params: { id: book, book: invalid_attributes } } }
        it { is_expected.to_not change{ book.reload.title } }
        it { is_expected.to_not change{ book.reload.grade } }
        it { is_expected.to_not change{ book.reload.author } }
        it { is_expected.to_not change{ book.reload.description} }
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:book) { create :book }
    subject { delete :destroy, params: { id: book.id } }

    it { is_expected.to redirect_to books_path }

    it 'flashes info' do
      subject
      expect(flash[:notice]).to eq('Book was successfully destroyed.')
    end

    it 'destroys book' do
      expect{ subject }.to change(Book, :count).by(-1)
    end
  end
end
