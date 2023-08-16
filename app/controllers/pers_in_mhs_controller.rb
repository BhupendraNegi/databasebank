class PersInMhsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pers_in_mh, only: %i[ edit update destroy ]

  # GET /pers_in_mhs/new
  def new
    @pers_in_mh = PersInMh.new
  end

  # GET /pers_in_mhs/1/edit
  def edit
  end

  # POST /pers_in_mhs or /pers_in_mhs.json
  def create
    @pers_in_mh = PersInMh.new(pers_in_mh_params)

    respond_to do |format|
      if @pers_in_mh.save
        format.html {  redirect_to bn_nominal_roll_url(@pers_in_mh.bn_nominal_roll), notice: "Pers in mh was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pers_in_mhs/1 or /pers_in_mhs/1.json
  def update
    respond_to do |format|
      if @pers_in_mh.update(pers_in_mh_params)
        format.html { redirect_to bn_nominal_roll_url(@pers_in_mh.bn_nominal_roll), notice: "Pers in mh was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pers_in_mhs/1 or /pers_in_mhs/1.json
  def destroy
    @pers_in_mh.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@pers_in_mh.bn_nominal_roll), notice: "Pers in mh was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pers_in_mh
      @pers_in_mh = PersInMh.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pers_in_mh_params
      parameters = params.require(:pers_in_mh).permit(:bn_nominal_rolls_id, :admitted_date, :no_of_days_in_mh, :diagonosis, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
