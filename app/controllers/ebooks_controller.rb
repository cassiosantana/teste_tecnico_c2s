class EbooksController < ApplicationController
  before_action :set_ebook, only: %i[ show edit update destroy ]

  def index
    @ebooks = Ebook.all
  end

  def show; end

  def new
    @ebook = Ebook.new
  end

  def edit; end

  def create
    @ebook = Ebook.new(ebook_params)

    if @ebook.save
      redirect_to @ebook, notice: "Ebook was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @ebook.update(ebook_params)
      redirect_to @ebook, notice: "Ebook was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ebook.destroy!

    redirect_to ebooks_path, status: :see_other, notice: "Ebook was successfully destroyed."
  end

  private
    def set_ebook
      @ebook = Ebook.find(params[:id])
    end

    def ebook_params
      params.require(:ebook).permit(:title, :description, :author, :isbn, :price)
    end
end
