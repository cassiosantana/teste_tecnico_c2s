# frozen_string_literal: true

module Ebooks
  class CsvUploaderService < ApplicationService
    def initialize(uploaded_file)
      @uploaded_file = uploaded_file
      super
    end

    def call
      csv_path = Rails.root.join("storage", @uploaded_file.original_filename).to_s
      File.open(csv_path, "wb") do |file|
        file.write(@uploaded_file.read)
      end
      csv_path
    end
  end
end
