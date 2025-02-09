class ScrapingController < ApplicationController

  def search; end

  def pull_book_info
    if params[:book_url].present?
      scraper = Scraping::BookScraperService.new(params[:book_url])
      book_info = scraper.call

      Ebooks::CreatorService.call([ book_info ])

      redirect_to ebooks_path, notice: "Ebook saved successfully!"
    else
      redirect_to ebooks_path, notice: "Something went wrong"
    end
  end
end
