class EbooksController < ApplicationController
  before_action :set_ebook, only: %i[ show edit update destroy ]

  # GET /ebooks or /ebooks.json
  def index
    @ebooks = Ebook.all
  end

  # GET /ebooks/1 or /ebooks/1.json
  def show
  end

  # GET /ebooks/new
  def new
    @ebook = Ebook.new
  end

  # GET /ebooks/1/edit
  def edit
  end

  # POST /ebooks or /ebooks.json
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

  # PATCH/PUT /ebooks/1 or /ebooks/1.json
  def update
    if @ebook.update(ebook_params)
      redirect_to @ebook, notice: "Ebook was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /ebooks/1 or /ebooks/1.json
  def destroy
    @ebook.destroy!

    redirect_to ebooks_path, status: :see_other, notice: "Ebook was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ebook
      @ebook = Ebook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ebook_params
      params.require(:ebook).permit(:title, :description, :author, :isbn, :price)
    end
end
