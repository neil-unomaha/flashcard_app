class FillinCategoriesController < ApplicationController
  before_action :set_fillin_category, only: %i[ show edit update destroy ]

  # GET /fillin_categories or /fillin_categories.json
  def index
    @fillin_categories = FillinCategory.all.order(:name)
  end

  # GET /fillin_categories/1 or /fillin_categories/1.json
  def show
  end

  # GET /fillin_categories/new
  def new
    @fillin_category = FillinCategory.new(fillin_domain_id: params[:fillin_domain_id])
  end

  # GET /fillin_categories/1/edit
  def edit
  end

  # POST /fillin_categories or /fillin_categories.json
  def create
    @fillin_category = FillinCategory.new(fillin_category_params)

    respond_to do |format|
      if @fillin_category.save
        format.html { redirect_to fillin_category_url(@fillin_category), notice: "Fillin category was successfully created." }
        format.json { render :show, status: :created, location: @fillin_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fillin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fillin_categories/1 or /fillin_categories/1.json
  def update
    respond_to do |format|
      if @fillin_category.update(fillin_category_params)
        format.html { redirect_to fillin_category_url(@fillin_category), notice: "Fillin category was successfully updated." }
        format.json { render :show, status: :ok, location: @fillin_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fillin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fillin_categories/1 or /fillin_categories/1.json
  def destroy
    @fillin_category.destroy

    respond_to do |format|
      format.html { redirect_to fillin_categories_url, notice: "Fillin category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fillin_category
      @fillin_category = FillinCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fillin_category_params
      params.require(:fillin_category).permit(:name, :fillin_domain_id)
    end
end
