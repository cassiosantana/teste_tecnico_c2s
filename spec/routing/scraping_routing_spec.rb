require "rails_helper"

RSpec.describe ScrapingController, type: :routing do
  describe "routing" do
    it "routes to #search" do
      expect(get: "/scraping/search").to route_to("scraping#search")
    end

    it "routes to #pull_book_info" do
      expect(post: "/scraping/pull_book_info").to route_to("scraping#pull_book_info")
    end
  end
end
