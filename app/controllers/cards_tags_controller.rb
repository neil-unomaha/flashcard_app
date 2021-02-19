class CardsTagsController < ApplicationController
  before_action :set_cards_tag, only: %i[ show edit update destroy ]

  # GET /cards_tags or /cards_tags.json
  def index
    @cards_tags = CardsTag.all
  end

  # GET /cards_tags/1 or /cards_tags/1.json
  def show
  end

  # GET /cards_tags/new
  def new
    @cards_tag = CardsTag.new
  end

  # GET /cards_tags/1/edit
  def edit
  end

  # POST /cards_tags or /cards_tags.json
  def create
    @cards_tag = CardsTag.new(cards_tag_params)

    respond_to do |format|
      if @cards_tag.save
        format.html { redirect_to @cards_tag, notice: "Cards tag was successfully created." }
        format.json { render :show, status: :created, location: @cards_tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cards_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards_tags/1 or /cards_tags/1.json
  def update
    respond_to do |format|
      if @cards_tag.update(cards_tag_params)
        format.html { redirect_to @cards_tag, notice: "Cards tag was successfully updated." }
        format.json { render :show, status: :ok, location: @cards_tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cards_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards_tags/1 or /cards_tags/1.json
  def destroy
    @cards_tag.destroy
    respond_to do |format|
      format.html { redirect_to cards_tags_url, notice: "Cards tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cards_tag
      @cards_tag = CardsTag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cards_tag_params
      params.require(:cards_tag).permit(:card_id, :tag_id)
    end
end
