module Api
  module V1
    class EbooksController < ApplicationController
      before_action :set_ebook, only: [ :show, :update, :destroy ]

      def index
        @ebooks = Ebook.all
        render json: @ebooks
      end

      def show
        render json: @ebook
      end

      def create
        @ebook = Ebook.new(ebook_params)
        if @ebook.save
          render json: @ebook, status: :created
        else
          render json: @ebook.errors, status: :unprocessable_entity
        end
      end

      def update
        if @ebook.update(ebook_params)
          render json: @ebook
        else
          render json: @ebook.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @ebook.destroy
        head :no_content
      end

      private

      def set_ebook
        @ebook = Ebook.find(params[:id])
      end

      def ebook_params
        params.require(:ebook).permit(:title, :description, :author, :isbn, :price)
      end
    end
  end
end
