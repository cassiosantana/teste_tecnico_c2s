module Scraping
  class BookScraperService < ApplicationService
    def initialize(url)
      @url = url
      @document = Nokogiri::HTML4(HTTParty.get(url).body)
    end

    def call
      scrape
    end

    private

    def scrape
      {
        title: @document.css(".product_main h1").text.strip,
        description: @document.css("#product_description + p:not(.price)").text.strip,
        price: @document.css(".product_main .price_color").text.strip.gsub("£", ""),
        isbn: @document.css('th:contains("UPC") + td').text.strip
      }
    end
  end
end
