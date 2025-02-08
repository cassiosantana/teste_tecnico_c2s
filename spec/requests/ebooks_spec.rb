require "rails_helper"

RSpec.describe "/ebooks", type: :request do
  let!(:user) { User.create!(email: "user@example.com", password: "password", password_confirmation: "password") }
  let!(:ebook) { Ebook.create!(title: "Test Title", author: "Test Author") }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      get ebooks_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get ebook_url(ebook)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_ebook_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_ebook_url(ebook)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    it "creates a new Ebook and redirects to it" do
      expect {
        post ebooks_url, params: { ebook: { title: "New Title", author: "New Author" } }
      }.to change(Ebook, :count).by(1)
      expect(response).to redirect_to(ebook_url(Ebook.last))
    end
  end

  describe "PATCH /update" do
    it "updates the requested ebook and redirects" do
      patch ebook_url(ebook), params: { ebook: { title: "Updated Title" } }
      ebook.reload
      expect(ebook.title).to eq("Updated Title")
      expect(response).to redirect_to(ebook_url(ebook))
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested ebook and redirects to index" do
      expect {
        delete ebook_url(ebook)
      }.to change(Ebook, :count).by(-1)
      expect(response).to redirect_to(ebooks_url)
    end
  end
end
