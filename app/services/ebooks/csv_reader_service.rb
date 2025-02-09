# frozen_string_literal: true

module Ebooks
  class CsvReaderService < ApplicationService
    def initialize(csv_path)
      @csv_path = csv_path
      super
    end

    def call
      process_csv
    end

    private

    def process_csv
      ebook_collection = []

      CSV.foreach(@csv_path, headers: true) do |row|
        ebook_collection << process_csv_row(row)
      end

      ebook_collection
    end

    def process_csv_row(row)
      row.to_h
    end
  end
end
