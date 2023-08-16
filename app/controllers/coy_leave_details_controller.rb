class CoyLeaveDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_coy_leave_detail, only: %i[edit update destroy ]

  # GET /coy_leave_details/new
  def new
    @coy_leave_detail = CoyLeaveDetail.new
  end

  # GET /coy_leave_details/1/edit
  def edit
  end

  # POST /coy_leave_details or /coy_leave_details.json
  def create
    @coy_leave_detail = CoyLeaveDetail.new(coy_leave_detail_params)

    respond_to do |format|
      if @coy_leave_detail.save
        format.html { redirect_to bn_nominal_roll_url(@coy_leave_detail.bn_nominal_roll), notice: "Coy leave detail was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coy_leave_details/1 or /coy_leave_details/1.json
  def update
    respond_to do |format|
      if @coy_leave_detail.update(coy_leave_detail_params)
        format.html { redirect_to bn_nominal_roll_url(@coy_leave_detail.bn_nominal_roll), notice: "Coy leave detail was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coy_leave_details/1 or /coy_leave_details/1.json
  def destroy
    @coy_leave_detail.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@coy_leave_detail.bn_nominal_roll), notice: "Coy leave detail was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coy_leave_detail
      @coy_leave_detail = CoyLeaveDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coy_leave_detail_params
      parameters = params.require(:coy_leave_detail).permit(:bn_nominal_rolls_id, :al, :cl, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
