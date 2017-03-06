require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      :name => "MyString",
      :grade => "MyString",
      :author => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input#book_name[name=?]", "book[name]"

      assert_select "input#book_grade[name=?]", "book[grade]"

      assert_select "input#book_author[name=?]", "book[author]"

      assert_select "input#book_description[name=?]", "book[description]"
    end
  end
end
