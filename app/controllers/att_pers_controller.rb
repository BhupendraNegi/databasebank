class AttPersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_att_per, only: %i[ edit update destroy ]

  # GET /att_pers/new
  def new
    @att_per = AttPer.new
  end

  # GET /att_pers/1/edit
  def edit
  end

  # POST /att_pers or /att_pers.json
  def create
    @att_per = AttPer.new(att_per_params)

    respond_to do |format|
      if @att_per.save
        format.html { redirect_to bn_nominal_roll_url(@att_per.bn_nominal_roll), notice: "Att per was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /att_pers/1 or /att_pers/1.json
  def update
    respond_to do |format|
      if @att_per.update(att_per_params)
        format.html { redirect_to bn_nominal_roll_url(@att_per.bn_nominal_roll), notice: "Att per was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /att_pers/1 or /att_pers/1.json
  def destroy
    @att_per.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@att_per.bn_nominal_roll), notice: "Att per was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_att_per
      @att_per = AttPer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def att_per_params
      parameters = params.require(:att_per).permit(:bn_nominal_rolls_id, :unit, :unit_location, :att_as_on, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
