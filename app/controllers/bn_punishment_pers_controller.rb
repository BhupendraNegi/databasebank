class BnPunishmentPersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bn_punishment_per, only: %i[ edit update destroy ]

  # GET /bn_punishment_pers/new
  def new
    @bn_punishment_per = BnPunishmentPer.new
  end

  # GET /bn_punishment_pers/1/edit
  def edit
  end

  # POST /bn_punishment_pers or /bn_punishment_pers.json
  def create
    @bn_punishment_per = BnPunishmentPer.new(bn_punishment_per_params)

    respond_to do |format|
      if @bn_punishment_per.save
        format.html { redirect_to bn_nominal_roll_url(@bn_punishment_per.bn_nominal_roll), notice: "Bn punishment per was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bn_punishment_pers/1 or /bn_punishment_pers/1.json
  def update
    respond_to do |format|
      if @bn_punishment_per.update(bn_punishment_per_params)
        format.html { redirect_to bn_nominal_roll_url(@bn_punishment_per.bn_nominal_roll), notice: "Bn punishment per was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bn_punishment_pers/1 or /bn_punishment_pers/1.json
  def destroy
    @bn_punishment_per.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@bn_punishment_per.bn_nominal_roll), notice: "Bn punishment per was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bn_punishment_per
      @bn_punishment_per = BnPunishmentPer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bn_punishment_per_params
      parameters = params.require(:bn_punishment_per).permit(:bn_nominal_rolls_id, :red_black, :duration_on_period, :army_act, :punishment_award_ed, :location, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
