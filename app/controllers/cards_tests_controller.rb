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
    # the start of a test
    if params[:start_test].present?
      @cards_test.update_column(:correct, nil)
      # clear out all existing answers for the test to reset it
      @cards_test.test.cards_tests.each do |ct|
        ct.update_column(:correct, nil)
      end
    end
  end

  # POST /cards_tests or /cards_tests.json
  def create
    @cards_test = CardsTest.new(cards_test_params)

    respond_to do |format|
      if @cards_test.save
        format.html { redirect_to @cards_test, notice: "Cards test was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def update
    if params[:Incorrect].present?
      @cards_test.update_column(:correct, false)
    elsif params[:Correct].present?
      @cards_test.update_column(:correct, true)
    end

    # if all the answers are done, redirect to the show screen
    if @cards_test.test.cards_tests.all?(&:answered?)
      redirect_to @cards_test 
    else
      # one or more questions do not have an answer, so continue the test.
      redirect_to(edit_cards_test_path(@cards_test.test.cards_tests.unanswered.to_a.shuffle.first))
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
      # params.require(:cards_test).permit(:card_id, :test_id, :correct)
      params.require(:cards_test).permit(:correct)
    end
end
