require "swagger_helper"

describe "Ebooks API" do
  path "/api/v1/ebooks" do
    get "Retrieves all ebooks" do
      tags "Ebooks"
      produces "application/json"

      response "200", "ebooks found" do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   description: { type: :string },
                   isbn: { type: :string },
                   price: { type: :string, format: :decimal }
                 },
                 required: %w[id title description isbn price]
               }
        run_test!
      end
    end
  end

  path "/api/v1/ebooks/{id}" do
    get "Retrieves a single ebook" do
      tags "Ebooks"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response "200", "ebook found" do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 description: { type: :string },
                 isbn: { type: :string },
                 price: { type: :string, format: :decimal }
               },
               required: %w[id title description isbn price]

        let(:id) { Ebook.create(title: "Example Title", description: "Description", isbn: "1234567890", price: 9.99).id }
        run_test!
      end

      response "404", "ebook not found" do
        let(:id) { "invalid" }
        run_test!
      end
    end
  end

  path "/api/v1/ebooks" do
    post "Creates a new ebook" do
      tags "Ebooks"
      consumes "application/json"
      parameter name: :ebook, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          isbn: { type: :string },
          price: { type: :number }
        },
        required: %w[title description isbn price]
      }

      response "201", "ebook created" do
        let(:ebook) { { title: "New Ebook", description: "Description", isbn: "1234567890", price: 19.99 } }
        run_test!
      end

      response "422", "invalid request" do

        let(:ebook) { { title: "" } }
        run_test!
      end
    end
  end

  path "/api/v1/ebooks/{id}" do
    patch "Updates an existing ebook" do
      tags "Ebooks"
      consumes "application/json"
      parameter name: :id, in: :path, type: :string
      parameter name: :ebook, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          isbn: { type: :string },
          price: { type: :number }
        }
      }

      response "200", "ebook updated" do
        let(:id) { Ebook.create(title: "Old Title", description: "Old Description", isbn: "1234567890", price: 9.99).id }
        let(:ebook) { { title: "Updated Title", description: "Updated Description", isbn: "1234567890", price: 19.99 } }
        run_test!
      end

      response "404", "ebook not found" do
        let(:id) { "invalid" }
        let(:ebook) { { title: "Updated Title" } }
        run_test!
      end
    end
  end

  # Documentando o DELETE para deletar um ebook
  path "/api/v1/ebooks/{id}" do
    delete "Deletes an ebook" do
      tags "Ebooks"
      parameter name: :id, in: :path, type: :string

      response "204", "ebook deleted" do
        let(:id) { Ebook.create(title: "To Be Deleted", description: "To Be Deleted", isbn: "1234567890", price: 9.99).id }
        run_test!
      end

      response "404", "ebook not found" do
        let(:id) { "invalid" }
        run_test!
      end
    end
  end
end
