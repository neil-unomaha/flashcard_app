class FillinCardsController < ApplicationController
  before_action :set_fillin_card, only: %i[ show edit update destroy ]

  # GET /fillin_cards or /fillin_cards.json
  def index
  end

  # GET /fillin_cards/1 or /fillin_cards/1.json
  def show
  end

  # GET /fillin_cards/new
  def new
    @fillin_card = FillinCard.new(fillin_domain_id: params[:fillin_domain_id], fillin_category_id: params[:fillin_category_id])
  end

  # GET /fillin_cards/1/edit
  def edit
  end

  # POST /fillin_cards or /fillin_cards.json
  def create
    @fillin_card = FillinCard.new(fillin_card_params)

    respond_to do |format|
      if @fillin_card.save
        @fillin_card.callback_after_create_and_update
        format.html { redirect_to @fillin_card.fillin_category, notice: "Fill-in Card was successfully created." }
        format.json { render :show, status: :created, location: @fillin_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fillin_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fillin_cards/1 or /fillin_cards/1.json
  def update
    respond_to do |format|
      if @fillin_card.update(fillin_card_params)
        @fillin_card.callback_after_create_and_update
        format.html { redirect_to fillin_card_url(@fillin_card), notice: "Fillin card was successfully updated." }
        format.json { render :show, status: :ok, location: @fillin_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fillin_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fillin_cards/1 or /fillin_cards/1.json
  def destroy
    @fillin_card.destroy

    respond_to do |format|
      format.html { redirect_to @fillin_card.fillin_category, notice: "Fill-in Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fillin_card
      @fillin_card = FillinCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fillin_card_params
      params.require(:fillin_card).permit(:additional_info, :question, :fillin_domain_id, :fillin_category_id)
    end
end
