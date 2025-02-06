require 'rails_helper'

RSpec.describe "ebooks/edit", type: :view do
  let(:ebook) {
    Ebook.create!(
      title: "MyString",
      description: "MyText",
      author: "MyString",
      isbn: "MyString",
      price: "9.99"
    )
  }

  before(:each) do
    assign(:ebook, ebook)
  end

  it "renders the edit ebook form" do
    render

    assert_select "form[action=?][method=?]", ebook_path(ebook), "post" do

      assert_select "input[name=?]", "ebook[title]"

      assert_select "textarea[name=?]", "ebook[description]"

      assert_select "input[name=?]", "ebook[author]"

      assert_select "input[name=?]", "ebook[isbn]"

      assert_select "input[name=?]", "ebook[price]"
    end
  end
end
