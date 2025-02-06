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

    respond_to do |format|
      if @ebook.save
        format.html { redirect_to @ebook, notice: "Ebook was successfully created." }
        format.json { render :show, status: :created, location: @ebook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ebook.errors, status: :unprocessable_entity }
      end
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
