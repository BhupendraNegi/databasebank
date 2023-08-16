class BnNominalRollsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bn_nominal_roll, only: %i[ show edit update destroy ]

  # GET /bn_nominal_rolls/1 or /bn_nominal_rolls/1.json
  def show
    @bn_lmc_pers = @bn_nominal_roll.bn_lmc_pers
    @coy_leave_details = @bn_nominal_roll.coy_leave_detail
    @bn_punishment_pers = @bn_nominal_roll.bn_punishment_pers
  end

  # GET /bn_nominal_rolls/new
  def new
    @bn_nominal_roll = BnNominalRoll.new
  end

  # GET /bn_nominal_rolls/1/edit
  def edit
  end

  # POST /bn_nominal_rolls or /bn_nominal_rolls.json
  def create
    @bn_nominal_roll = BnNominalRoll.new(bn_nominal_roll_params)

    respond_to do |format|
      if @bn_nominal_roll.save
        format.html { redirect_to bn_nominal_roll_url(@bn_nominal_roll), notice: "Bn nominal roll was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bn_nominal_rolls/1 or /bn_nominal_rolls/1.json
  def update
    respond_to do |format|
      if @bn_nominal_roll.update(bn_nominal_roll_params)
        format.html { redirect_to bn_nominal_roll_url(@bn_nominal_roll), notice: "Bn nominal roll was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bn_nominal_rolls/1 or /bn_nominal_rolls/1.json
  def destroy
    @bn_nominal_roll.destroy

    respond_to do |format|
      format.html { redirect_to home_index_url, notice: "Bn nominal roll was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bn_nominal_roll
      @bn_nominal_roll = BnNominalRoll.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bn_nominal_roll_params
      params.fetch(:bn_nominal_roll, {}).permit(:army_no, :rank, :trade, :name, :date_of_tos_in_unit, :coy, :civ_edn, :marital_status ,:remarks)
    end
end
