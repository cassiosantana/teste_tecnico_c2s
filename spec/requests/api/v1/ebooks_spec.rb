require "rails_helper"
require "ffaker"

RSpec.describe "Api::V1::Ebooks", type: :request do
  let!(:ebook) do
    Ebook.create(
      title: FFaker::Book.title,
      description: FFaker::Book.description,
      author: FFaker::Name.name,
      isbn: FFaker::Book.isbn,
      price: FFaker::Random.rand(1.0..100.0)
    )
  end
  let(:ebook_id) { ebook.id }
  let(:valid_attributes) do
    {
      title: FFaker::Book.title,
      description: FFaker::Book.description,
      author: FFaker::Name.name,
      isbn: FFaker::Book.isbn,
      price: FFaker::Random.rand(1.0..100.0)
    }
  end

  describe "GET /api/v1/ebooks" do
    it "returns all ebooks" do
      get api_v1_ebooks_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include(ebook.title)
      expect(JSON.parse(response.body).size).to eq(Ebook.count)
    end
  end

  describe "GET /api/v1/ebooks/:id" do
    it "returns a single ebook" do
      get api_v1_ebook_path(ebook_id)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(ebook.title)
      expect(response.body).to include(ebook_id.to_s)
    end
  end

  describe "POST /api/v1/ebooks" do
    it "creates a new ebook" do
      expect {
        post api_v1_ebooks_path, params: { ebook: valid_attributes }
      }.to change(Ebook, :count).by(1)
      expect(response).to have_http_status(:created)
      expect(response.body).to include(valid_attributes[:title])
    end
  end

  describe "PATCH /api/v1/ebooks/:id" do
    it "updates the ebook" do
      patch api_v1_ebook_path(ebook_id), params: { ebook: { title: "Updated Title" } }
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Updated Title")
    end
  end

  describe "DELETE /api/v1/ebooks/:id" do
    it "deletes the ebook" do
      expect {
        delete api_v1_ebook_path(ebook_id)
      }.to change(Ebook, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
