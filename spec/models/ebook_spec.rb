require 'rails_helper'

RSpec.describe Ebook, type: :model do
  it { should validate_presence_of(:title) }
end
