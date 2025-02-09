# spec/requests/scraping_spec.rb
require "rails_helper"

RSpec.describe "Scraping", type: :request do
  let(:url) { "https://books.toscrape.com/catalogue/sharp-objects_997/index.html" }

  describe "POST /scraping/pull_book_info" do
    before do
      allow(HTTParty).to receive(:get).and_return(double(body: File.read(Rails.root.join("spec", "fixtures", "sharp_objects.html"))))
      allow(Ebooks::CreatorService).to receive(:call)
    end

    context "quando a URL do livro é fornecida" do
      it "extrai as informações do livro e redireciona para ebooks_path" do
        post "/scraping/pull_book_info", params: { book_url: url }

        expect(response).to redirect_to(ebooks_path)
        follow_redirect!

        expect(flash[:notice]).to eq("Ebook saved successfully!")
        expect(Ebooks::CreatorService).to have_received(:call).with(
          [
            { title: "Sharp Objects",
              description: "A brilliant, haunting debut novel.",
              price: "51.77",
              isbn: "1234567890123"
            }
          ]
        )
      end
    end

    context "quando a URL do livro não é fornecida" do
      it "redireciona para ebooks_path com mensagem de erro" do
        post "/scraping/pull_book_info", params: { book_url: ""}

        expect(response).to redirect_to(ebooks_path)
        follow_redirect!

        expect(flash[:notice]).to eq("Something went wrong")
      end
    end
  end
end
