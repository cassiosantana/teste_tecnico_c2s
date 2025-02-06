require 'rails_helper'

RSpec.describe "ebooks/show", type: :view do
  before(:each) do
    assign(:ebook, Ebook.create!(
      title: "Title",
      description: "MyText",
      author: "Author",
      isbn: "Isbn",
      price: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Isbn/)
    expect(rendered).to match(/9.99/)
  end
end
