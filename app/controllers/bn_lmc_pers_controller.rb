class BnLmcPersController < ApplicationController
  before_action :set_bn_lmc_per, only: %i[ show edit update destroy ]

  # GET /bn_lmc_pers or /bn_lmc_pers.json
  def index
    @bn_lmc_pers = BnLmcPer.all
  end

  # GET /bn_lmc_pers/1 or /bn_lmc_pers/1.json
  def show
  end

  # GET /bn_lmc_pers/new
  def new
    @bn_lmc_per = BnLmcPer.new
  end

  # GET /bn_lmc_pers/1/edit
  def edit
  end

  # POST /bn_lmc_pers or /bn_lmc_pers.json
  def create
    @bn_lmc_per = BnLmcPer.new(bn_lmc_per_params)

    respond_to do |format|
      if @bn_lmc_per.save
        format.html { redirect_to bn_lmc_per_url(@bn_lmc_per), notice: "Bn lmc per was successfully created." }
        format.json { render :show, status: :created, location: @bn_lmc_per }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bn_lmc_per.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bn_lmc_pers/1 or /bn_lmc_pers/1.json
  def update
    respond_to do |format|
      if @bn_lmc_per.update(bn_lmc_per_params)
        format.html { redirect_to bn_lmc_per_url(@bn_lmc_per), notice: "Bn lmc per was successfully updated." }
        format.json { render :show, status: :ok, location: @bn_lmc_per }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bn_lmc_per.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bn_lmc_pers/1 or /bn_lmc_pers/1.json
  def destroy
    @bn_lmc_per.destroy

    respond_to do |format|
      format.html { redirect_to bn_lmc_pers_url, notice: "Bn lmc per was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bn_lmc_per
      @bn_lmc_per = BnLmcPer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bn_lmc_per_params
      params.require(:bn_lmc_per).permit(:BnNominalRoll_id)
    end
end