require 'rails_helper'

RSpec.describe Ebook, type: :model do
  it 'is valid with valid attributes' do
    ebook = Ebook.new
    expect(ebook).to be_valid
  end

  it 'is not valid without attributes' do
    ebook = Ebook.new
    expect(ebook).to be_valid
  end
end
