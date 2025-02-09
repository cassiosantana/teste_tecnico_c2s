require "rails_helper"

RSpec.describe Ebooks::BatchSaveJob, type: :job do
  let(:batch) { [ { title: "Test Book" } ] }
  let(:creator_service) { class_double(Ebooks::CreatorService, call: true) }

  it "call creator_service with an ebook batch" do
    described_class.new.perform(batch, service: creator_service)

    expect(creator_service).to have_received(:call).with(batch)
  end
end
