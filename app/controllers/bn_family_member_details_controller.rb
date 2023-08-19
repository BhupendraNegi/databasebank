class BnFamilyMemberDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bn_family_member_detail, only: %i[ edit update destroy ]

  # GET /bn_family_member_details/new
  def new
    @bn_family_member_detail = BnFamilyMemberDetail.new
  end

  # GET /bn_family_member_details/1/edit
  def edit
  end

  # POST /bn_family_member_details or /bn_family_member_details.json
  def create
    @bn_family_member_detail = BnFamilyMemberDetail.new(bn_family_member_detail_params)

    respond_to do |format|
      if @bn_family_member_detail.save
        format.html { redirect_to bn_nominal_roll_url(@bn_family_member_detail.bn_nominal_roll), notice: "Bn family member detail was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bn_family_member_details/1 or /bn_family_member_details/1.json
  def update
    respond_to do |format|
      if @bn_family_member_detail.update(bn_family_member_detail_params)
        format.html { redirect_to bn_nominal_roll_url(@bn_family_member_detail.bn_nominal_roll), notice: "Bn family member detail was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bn_family_member_details/1 or /bn_family_member_details/1.json
  def destroy
    @bn_family_member_detail.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@bn_family_member_detail.bn_nominal_roll), notice: "Bn family member detail was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bn_family_member_detail
      @bn_family_member_detail = BnFamilyMemberDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bn_family_member_detail_params
      parameters = params.require(:bn_family_member_detail).permit(:bn_nominal_rolls_id, :wife_name, :dob_wife, :no_of_children, :present_address, :permanent_address, :qtr_occupation_date, :family_problem, :mob_no_indl, :mob_no_res, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
