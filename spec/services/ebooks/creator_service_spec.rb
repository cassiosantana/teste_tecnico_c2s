require "rails_helper"

RSpec.describe Ebooks::CreatorService do
  describe "#call" do
    let(:ebook_collection) { [ { title: FFaker::Book.title } ] }

    it "insert ebooks in the database" do
      expect { described_class.call(ebook_collection) }
        .to change { Ebook.count }.by(1)
    end
  end
end
