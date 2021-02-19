class CardsTestsController < ApplicationController
  before_action :set_cards_test, only: %i[ show edit update destroy ]

  # GET /cards_tests or /cards_tests.json
  def index
    @cards_tests = CardsTest.all
  end

  # GET /cards_tests/1 or /cards_tests/1.json
  def show
  end

  # GET /cards_tests/new
  def new
    @cards_test = CardsTest.new
  end

  # GET /cards_tests/1/edit
  def edit
  end

  # POST /cards_tests or /cards_tests.json
  def create
    @cards_test = CardsTest.new(cards_test_params)

    respond_to do |format|
      if @cards_test.save
        format.html { redirect_to @cards_test, notice: "Cards test was successfully created." }
        format.json { render :show, status: :created, location: @cards_test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cards_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards_tests/1 or /cards_tests/1.json
  def update
    respond_to do |format|
      if @cards_test.update(cards_test_params)
        format.html { redirect_to @cards_test, notice: "Cards test was successfully updated." }
        format.json { render :show, status: :ok, location: @cards_test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cards_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards_tests/1 or /cards_tests/1.json
  def destroy
    @cards_test.destroy
    respond_to do |format|
      format.html { redirect_to cards_tests_url, notice: "Cards test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cards_test
      @cards_test = CardsTest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cards_test_params
      params.require(:cards_test).permit(:card_id, :test_id, :correct)
    end
end
