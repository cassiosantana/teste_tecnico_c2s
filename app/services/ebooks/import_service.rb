# frozen_string_literal: true

module Ebooks
  class ImportService < ApplicationService
    BATCH_SIZE = 100

    def initialize(csv_path:, reader_service: Ebooks::CsvReaderService)
      @csv_path = csv_path
      @reader_service = reader_service
      super
    end

    def call
      @ebook_collection = @reader_service.call(@csv_path)
      process_batches
    end

    private

    def process_batches
      ebook_batch.each do |batch|
        Ebooks::BatchSaveJob.perform_async(batch)
      end
    end

    def ebook_batch
      @ebook_collection.each_slice(BATCH_SIZE).to_a
    end
  end
end
