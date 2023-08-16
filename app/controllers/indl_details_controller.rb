class IndlDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_indl_detail, only: %i[ edit update destroy ]

  # GET /indl_details/new
  def new
    @indl_detail = IndlDetail.new
  end

  # GET /indl_details/1/edit
  def edit
  end

  # POST /indl_details or /indl_details.json
  def create
    @indl_detail = IndlDetail.new(indl_detail_params)

    respond_to do |format|
      if @indl_detail.save
        format.html { redirect_to bn_nominal_roll_url(@indl_detail.bn_nominal_roll), notice: "Indl detail was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indl_details/1 or /indl_details/1.json
  def update
    respond_to do |format|
      if @indl_detail.update(indl_detail_params)
        format.html { redirect_to bn_nominal_roll_url(@indl_detail.bn_nominal_roll), notice: "Indl detail was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indl_details/1 or /indl_details/1.json
  def destroy
    @indl_detail.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@indl_detail.bn_nominal_roll), notice: "Indl detail was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indl_detail
      @indl_detail = IndlDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def indl_detail_params
      parameters = params.require(:indl_detail).permit(:bn_nominal_rolls_id, :pl, :sec, :i_card_number, :blood_group, :appt, :dob, :dt_of_enrollment, :dt_of_tos_in_unit, :dt_of_marriage, :dscp_record, :mob_no_indl, :mob_no_res, :pan_no, :uid_no, :lve_plan, :location, :email_id, :address, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
