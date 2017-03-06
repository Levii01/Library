require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :name => "MyString",
      :grade => "MyString",
      :author => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input#book_name[name=?]", "book[name]"

      assert_select "input#book_grade[name=?]", "book[grade]"

      assert_select "input#book_author[name=?]", "book[author]"

      assert_select "input#book_description[name=?]", "book[description]"
    end
  end
end
