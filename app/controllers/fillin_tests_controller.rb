class FillinTestsController < ApplicationController
  before_action :set_fillin_test, only: %i[ show edit update destroy ]

  # GET /fillin_tests or /fillin_tests.json
  def index
    @fillin_tests = FillinTest.all
  end

  # GET /fillin_tests/1 or /fillin_tests/1.json
  def show
  end

  # GET /fillin_tests/new
  def new
    @fillin_test = FillinTest.new
  end

  # GET /fillin_tests/1/edit
  def edit
  end

  # POST /fillin_tests or /fillin_tests.json
  def create
    @fillin_test = FillinTest.new(fillin_test_params)

    respond_to do |format|
      if @fillin_test.save
        format.html { redirect_to fillin_test_url(@fillin_test), notice: "Fillin test was successfully created." }
        format.json { render :show, status: :created, location: @fillin_test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fillin_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fillin_tests/1 or /fillin_tests/1.json
  def update
    respond_to do |format|
      if @fillin_test.update(fillin_test_params)
        format.html { redirect_to fillin_test_url(@fillin_test), notice: "Fillin test was successfully updated." }
        format.json { render :show, status: :ok, location: @fillin_test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fillin_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fillin_tests/1 or /fillin_tests/1.json
  def destroy
    @fillin_test.destroy

    respond_to do |format|
      format.html { redirect_to fillin_tests_url, notice: "Fillin test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fillin_test
      @fillin_test = FillinTest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fillin_test_params
      params.require(:fillin_test).permit(:name)
    end
end
