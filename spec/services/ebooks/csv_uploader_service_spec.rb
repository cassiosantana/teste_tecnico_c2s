require "rails_helper"

RSpec.describe Ebooks::CsvUploaderService do
  describe "#call" do
    let(:uploaded_file) { fixture_file_upload("ebooks.csv", "text/csv") }

    it "save the CSV file in the correct directory" do
      path = described_class.call(uploaded_file)
      expect(File.exist?(path)).to be true
    end
  end
end
