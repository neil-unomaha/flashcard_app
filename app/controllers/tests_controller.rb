class TestsController < ApplicationController
  before_action :set_test, only: %i[ show edit update destroy create_on_incorrect ]

  # GET /tests or /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1 or /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new(question_first: true)
  end

  def combine_new
    @test = Test.new(question_first: true)
  end

  def combine_create
    @test = Test.new(test_params)
    if @test.save
      if params[:test][:test_ids].reject(&:empty?).any?
        params[:test][:test_ids].reject(&:empty?).each do |test_id|
          Test.find(test_id).cards.each do |card|
            @test.cards_tests.build(card: card).save
          end
        end
      end
      redirect_to @test, notice: "Test was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests or /tests.json
  def create
    @test = Test.new(test_params)
    respond_to do |format|
      if @test.save
        # pull in all the cards for that category in order to make a test
        if params[:test][:category_ids].reject(&:empty?).any?
          params[:test][:category_ids].reject(&:empty?).each do |cat_id|
            Category.find(cat_id).cards.each do |card|
              @test.cards_tests.build(card: card).save
            end
          end
        end

        format.html { redirect_to @test, notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: "Test was successfully updated." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create_on_incorrect
    @incorrect_answers_test = Test.new(name: "Learn incorrect cards (from #{@test.name})", question_first: @test.question_first)
    @incorrect_answers_test.save
    @test.cards_tests.each do |ct|
      next if ct.correct?
      CardsTest.create(test: @incorrect_answers_test, card: ct.card )
    end
    redirect_to @incorrect_answers_test, notice: "Test of incorrect cards created successfully."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:question_first, :name, :category_ids, :test_ids)
    end
end
