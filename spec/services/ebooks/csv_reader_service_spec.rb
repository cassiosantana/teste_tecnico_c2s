require "rails_helper"
require "csv"

RSpec.describe Ebooks::CsvReaderService do
  describe "#call" do
    let(:csv_path) { file_fixture("ebooks.csv").to_s }

    it "reads and processes the CSV correctly" do
      result = described_class.call(csv_path)

      expected_result = [
        {
          "title" => "Season of the Killer Mutant",
          "description" => "Quibusdam non deserunt ex eius autem consectetur. Velit optio facilis animi itaque impedit. Soluta veniam sint nesciunt ipsa architecto quaerat pariatur qui. Totam sapiente delectus assumenda dolores iste consequuntur. Debitis vero ad culpa asperiores id cupiditate.",
          "isbn" => "7080767980",
          "price" => "213.2"
        },
        {
          "title" => "The Forbidden Man",
          "description" => "Reiciendis libero occaecati quaerat aliquam aspernatur fugiat placeat eos. Nam consectetur officiis doloremque aspernatur laudantium tempora nemo. Natus quod culpa quaerat earum iusto. Accusamus architecto iste magnam quis consectetur doloribus.",
          "isbn" => "17222025436",
          "price" => "383.6"
        }
      ]

      expect(result.first(2)).to eq(expected_result)
      expect(result.size).to eq(5)
    end
  end
end
