class FillinCardTestsController < ApplicationController
  before_action :set_fillin_card_test, only: %i[ show edit update destroy ]

  # GET /fillin_card_tests or /fillin_card_tests.json
  def index
    @fillin_card_tests = FillinCardTest.all
  end

  # GET /fillin_card_tests/1 or /fillin_card_tests/1.json
  def show
  end

  # GET /fillin_card_tests/new
  def new
    @fillin_card_test = FillinCardTest.new
  end

  # GET /fillin_card_tests/1/edit
  def edit
  end

  # POST /fillin_card_tests or /fillin_card_tests.json
  def create
    @fillin_card_test = FillinCardTest.new(fillin_card_test_params)

    respond_to do |format|
      if @fillin_card_test.save
        format.html { redirect_to fillin_card_test_url(@fillin_card_test), notice: "Fillin card test was successfully created." }
        format.json { render :show, status: :created, location: @fillin_card_test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fillin_card_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fillin_card_tests/1 or /fillin_card_tests/1.json
  def update
    respond_to do |format|
      if @fillin_card_test.update(fillin_card_test_params)
        format.html { redirect_to fillin_card_test_url(@fillin_card_test), notice: "Fillin card test was successfully updated." }
        format.json { render :show, status: :ok, location: @fillin_card_test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fillin_card_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fillin_card_tests/1 or /fillin_card_tests/1.json
  def destroy
    @fillin_card_test.destroy

    respond_to do |format|
      format.html { redirect_to fillin_card_tests_url, notice: "Fillin card test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fillin_card_test
      @fillin_card_test = FillinCardTest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fillin_card_test_params
      params.require(:fillin_card_test).permit(:fillin_card_id, :position_hide, :correct, :test_id)
    end
end
