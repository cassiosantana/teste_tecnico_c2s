require 'rails_helper'

RSpec.describe "ebooks/index", type: :view do
  before(:each) do
    assign(:ebooks, [
      Ebook.create!(
        title: "Title",
        description: "MyText",
        author: "Author",
        isbn: "Isbn",
        price: "9.99"
      ),
      Ebook.create!(
        title: "Title",
        description: "MyText",
        author: "Author",
        isbn: "Isbn",
        price: "9.99"
      )
    ])
  end

  it "renders a list of ebooks" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Author".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Isbn".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
