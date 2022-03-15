class FillinTestsController < ApplicationController
  before_action :set_fillin_test, only: %i[ show edit update destroy ]

  # GET /fillin_tests or /fillin_tests.json
  def index
    @fillin_tests = FillinTest.all.includes(fillin_card_tests: [:fillin_card_answers, fillin_card: [:fillin_domain, :fillin_category]])
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
    @fillin_test = FillinTest.new(fillin_test_new_params)

    respond_to do |format|
      if @fillin_test.save

        # pull in all the cards for that category in order to make a test
        if params[:fillin_test][:fillin_category_ids].reject(&:empty?).any?
          params[:fillin_test][:fillin_category_ids].reject(&:empty?).each do |cat_id|
            FillinCategory.find(cat_id).fillin_cards.each do |fillin_card|
              @fillin_test.fillin_card_tests.build(fillin_card: fillin_card).save
            end
          end
        end

        # The fillin cards exist. Now create all the answers and by default "Hide" teh answer so it has to be filled in
        @fillin_test.fillin_card_tests.each do |fillin_card_test|
          fillin_card_test.fillin_card.fillin_card_answers.each do |fillin_answer|
            FillinCardTestUserAnswer.new(fillin_card_test_id: fillin_card_test.id, fillin_card_answer_id: fillin_answer.id, hidden: true).save
          end
        end

        format.html { redirect_to edit_fillin_test_path(@fillin_test), notice: "Specify which portions of each card to show/hide." }
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
      if @fillin_test.update(fillin_test_edit_params)
        format.html { redirect_to @fillin_test, notice: "Fillin test was successfully created." }
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
      @fillin_test = FillinTest.includes(fillin_card_tests: [:fillin_card_answers, fillin_card: [:fillin_domain, :fillin_category]]).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fillin_test_new_params
      params.require(:fillin_test).permit(:name, :fillin_category_ids)
    end

    def fillin_test_edit_params
      params.require(:fillin_test).permit(:name, :fillin_category_ids)
      params.require(:fillin_test).permit(fillin_card_tests_attributes: [:id, fillin_card_test_user_answers_attributes: [:id, :hidden]])
    end
end
