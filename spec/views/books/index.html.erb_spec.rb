require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :name => "Name",
        :grade => "Grade",
        :author => "Author",
        :description => "Description"
      ),
      Book.create!(
        :name => "Name",
        :grade => "Grade",
        :author => "Author",
        :description => "Description"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Grade".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
