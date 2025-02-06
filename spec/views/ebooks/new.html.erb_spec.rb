require 'rails_helper'

RSpec.describe "ebooks/new", type: :view do
  before(:each) do
    assign(:ebook, Ebook.new(
      title: "MyString",
      description: "MyText",
      author: "MyString",
      isbn: "MyString",
      price: "9.99"
    ))
  end

  it "renders new ebook form" do
    render

    assert_select "form[action=?][method=?]", ebooks_path, "post" do

      assert_select "input[name=?]", "ebook[title]"

      assert_select "textarea[name=?]", "ebook[description]"

      assert_select "input[name=?]", "ebook[author]"

      assert_select "input[name=?]", "ebook[isbn]"

      assert_select "input[name=?]", "ebook[price]"
    end
  end
end
