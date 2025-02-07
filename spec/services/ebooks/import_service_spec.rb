require "rails_helper"

RSpec.describe Ebooks::ImportService do
  describe "#call" do
    let(:csv_path) { file_fixture("ebooks.csv").to_s }

    it "enqueues BatchSaveJob for each batch of ebooks" do
      allow(Ebooks::BatchSaveJob).to receive(:perform_async)

      described_class.call(csv_path: csv_path)

      expect(Ebooks::BatchSaveJob).to have_received(:perform_async).once
    end
  end
end
