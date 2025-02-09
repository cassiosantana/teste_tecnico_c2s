require "rails_helper"

RSpec.describe Scraping::BookScraperService, type: :service do
  let(:url) { "https://books.toscrape.com/catalogue/sharp-objects_997/index.html" }
  let(:scraper) { described_class.new(url) }

  before do
    allow(HTTParty).to receive(:get).and_return(double(body: File.read(Rails.root.join("spec", "fixtures", "sharp_objects.html"))))
  end

  describe "#call" do
    it "returns the correct book data" do
      result = scraper.call

      expect(result[:title]).to eq("Sharp Objects")
      expect(result[:description]).to eq("A brilliant, haunting debut novel.")
      expect(result[:price]).to eq("51.77")
      expect(result[:isbn]).to eq("1234567890123")
    end
  end
end
