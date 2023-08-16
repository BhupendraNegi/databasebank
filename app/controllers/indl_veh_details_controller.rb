class IndlVehDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_indl_veh_detail, only: %i[ edit update destroy ]
  # GET /indl_veh_details/new
  def new
    @indl_veh_detail = IndlVehDetail.new
  end

  # GET /indl_veh_details/1/edit
  def edit
  end

  # POST /indl_veh_details or /indl_veh_details.json
  def create
    @indl_veh_detail = IndlVehDetail.new(indl_veh_detail_params)

    respond_to do |format|
      if @indl_veh_detail.save
        format.html { redirect_to bn_nominal_roll_url(@indl_veh_detail.bn_nominal_roll), notice: "Indl veh detail was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indl_veh_details/1 or /indl_veh_details/1.json
  def update
    respond_to do |format|
      if @indl_veh_detail.update(indl_veh_detail_params)
        format.html { redirect_to bn_nominal_roll_url(@indl_veh_detail.bn_nominal_roll), notice: "Indl veh detail was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indl_veh_details/1 or /indl_veh_details/1.json
  def destroy
    @indl_veh_detail.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@indl_veh_detail.bn_nominal_roll), notice: "Indl veh detail was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indl_veh_detail
      @indl_veh_detail = IndlVehDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def indl_veh_detail_params
      parameters = params.require(:indl_veh_detail).permit(:bn_nominal_rolls_id, :type_of_veh, :veh_no, :location, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
