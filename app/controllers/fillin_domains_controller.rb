class FillinDomainsController < ApplicationController
  before_action :set_fillin_domain, only: %i[ show edit update destroy ]

  # GET /fillin_domains or /fillin_domains.json
  def index
    @fillin_domains = FillinDomain.all
  end

  # GET /fillin_domains/1 or /fillin_domains/1.json
  def show
  end

  # GET /fillin_domains/new
  def new
    @fillin_domain = FillinDomain.new
  end

  # GET /fillin_domains/1/edit
  def edit
  end

  # POST /fillin_domains or /fillin_domains.json
  def create
    @fillin_domain = FillinDomain.new(fillin_domain_params)

    respond_to do |format|
      if @fillin_domain.save
        format.html { redirect_to fillin_domain_url(@fillin_domain), notice: "Fillin domain was successfully created." }
        format.json { render :show, status: :created, location: @fillin_domain }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fillin_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fillin_domains/1 or /fillin_domains/1.json
  def update
    respond_to do |format|
      if @fillin_domain.update(fillin_domain_params)
        format.html { redirect_to fillin_domain_url(@fillin_domain), notice: "Fillin domain was successfully updated." }
        format.json { render :show, status: :ok, location: @fillin_domain }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fillin_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fillin_domains/1 or /fillin_domains/1.json
  def destroy
    @fillin_domain.destroy

    respond_to do |format|
      format.html { redirect_to fillin_domains_url, notice: "Fillin domain was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fillin_domain
      @fillin_domain = FillinDomain.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fillin_domain_params
      params.require(:fillin_domain).permit(:name)
    end
end
