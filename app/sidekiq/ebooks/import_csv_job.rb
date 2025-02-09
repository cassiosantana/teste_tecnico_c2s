# frozen_string_literal: true

module Ebooks
  class ImportCsvJob
    include Sidekiq::Job
    sidekiq_options queue: :batch_save

    def perform(csv_path, service: Ebooks::ImportService)
      service.call(csv_path:)
      File.delete(csv_path)
    end
  end
end
