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
    # the start of a test
    # so reset all cards to be neither correct/incorrect
    # and also rest the answers for each card to being unanswered
    if params[:start_test].present?
      @fillin_card_test.fillin_test.fillin_card_tests.each do |fct|
        fct.update_column(:correct, nil)
      end
      @fillin_card_test.fillin_test.fillin_card_tests.each do |fct|
        fct.fillin_card_test_user_answers.each do |fctua|
          fctua.update_column(:user_answer, nil)
        end
      end
    end

    @question_txt = @fillin_card_test.convert_to_question_display
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
    @fillin_card_test.update(test_question_params)
    @fillin_card_test.grade_answers
    @question_txt = @fillin_card_test.convert_to_question_display
    @are_all_answered = @fillin_card_test.fillin_test.all_answered?
    @next_question = @fillin_card_test.fillin_test.generate_next_question if !@are_all_answered

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
      params.require(:fillin_card_test).permit(:fillin_card_id, :correct, :test_id)
    end

    def test_question_params
      params.require(:fillin_card_test).permit(fillin_card_test_user_answers_attributes: [:id, :user_answer])
    end

    def the_redirect
      # if all the answers are done, redirect to the show screen
      if @fillin_card_test.fillin_test.fillin_card_tests.all?(&:answered?)
        redirect_to @fillin_card_test
      else
        # one or more questions do not have an answer, so continue the test.
        redirect_to(edit_fillin_card_test_path(@fillin_card_test.fillin_test.fillin_cards_tests.unanswered.to_a.shuffle.first))
      end
    end
end
