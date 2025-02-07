# frozen_string_literal: true

module Ebooks
  class BatchSaveJob
    include Sidekiq::Job
    sidekiq_options queue: :batch_save

    def perform(batch, service: Ebooks::CreatorService)
      service.call(batch)
    end
  end
end
