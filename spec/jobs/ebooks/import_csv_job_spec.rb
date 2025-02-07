require "rails_helper"

RSpec.describe Ebooks::ImportCsvJob, type: :job do
  let(:csv_path) { file_fixture("ebooks.csv").to_s }
  let(:service) { class_double(Ebooks::ImportService, call: true) }

  it "call ImportService and remove the file after processing" do
    allow(File).to receive(:delete)

    described_class.new.perform(csv_path, service: service)

    expect(service).to have_received(:call).with(csv_path: csv_path)
    expect(File).to have_received(:delete).with(csv_path)
  end
end
