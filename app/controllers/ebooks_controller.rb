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

  def import; end

  def import_csv
    if params[:csv_file].present?
      csv_path = Ebooks::CsvUploaderService.call(params[:csv_file])
      Ebooks::ImportCsvJob.perform_async(csv_path)

      redirect_to ebooks_path, notice: "CSV file is being imported."
    else
      redirect_to import_ebooks_path, notice: "Please select a CSV file."
    end
  end

  private
    def set_ebook
      @ebook = Ebook.find(params[:id])
    end

    def ebook_params
      params.require(:ebook).permit(:title, :description, :author, :isbn, :price)
    end
end
