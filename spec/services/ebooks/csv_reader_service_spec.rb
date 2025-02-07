require "rails_helper"
require "csv"

RSpec.describe Ebooks::CsvReaderService do
  describe "#call" do
    let(:csv_path) { file_fixture("ebooks.csv").to_s }

    it "reads and processes the CSV correctly" do
      result = described_class.call(csv_path)

      expected_result = [
        {
          "title" => "Planet of the Ultra Demon",
          "description" => "Dignissimos minima veniam optio quasi odit possimus ullam. Numquam minus id odio ea sequi esse. Quos exercitationem labore ipsa aut.",
          "author" => "Ute Nienow",
          "isbn" => "1019462146",
          "price" => "909.9"
        },
        {
          "title" => "Day of the Flying Cousins",
          "description" => "Distinctio suscipit eligendi iure ipsam dicta odit. Voluptate mollitia laudantium consectetur nam iusto velit. Fugit et quasi veritatis voluptatem iusto facere architecto minus. Error accusantium non minus optio.",
          "author" => "Dorris Sporer",
          "isbn" => "1163075717",
          "price" => "605.0"
        }
      ]

      expect(result.first(2)).to eq(expected_result)
      expect(result.size).to eq(5)
    end
  end
end
