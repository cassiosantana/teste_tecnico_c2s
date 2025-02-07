# frozen_string_literal: true

module Ebooks
  class CreatorService < ApplicationService
    def initialize(ebook_collection)
      @ebook_collection = ebook_collection
      super
    end

    def call
      create_ebooks
    end

    def create_ebooks
      Ebook.insert_all(@ebook_collection)
    end
  end
end
