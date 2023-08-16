class EreDetailsController < ApplicationController
  before_action :set_ere_detail, only: %i[ edit update destroy ]

  # GET /ere_details/new
  def new
    @ere_detail = EreDetail.new
  end

  # GET /ere_details/1/edit
  def edit
  end

  # POST /ere_details or /ere_details.json
  def create
    @ere_detail = EreDetail.new(ere_detail_params)

    respond_to do |format|
      if @ere_detail.save
        format.html { redirect_to bn_nominal_roll_url(@ere_detail.bn_nominal_roll), notice: "Ere detail was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ere_details/1 or /ere_details/1.json
  def update
    respond_to do |format|
      if @ere_detail.update(ere_detail_params)
        format.html { redirect_to bn_nominal_roll_url(@ere_detail.bn_nominal_roll), notice: "Ere detail was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ere_details/1 or /ere_details/1.json
  def destroy
    @ere_detail.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@ere_detail.bn_nominal_roll), notice: "Ere detail was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ere_detail
      @ere_detail = EreDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ere_detail_params
      parameters = params.require(:ere_detail).permit(:bn_nominal_rolls_id, :ere_unit, :ere_location, :date_of_sos_to_ere, :date_of_rtu_to_unit, :tenure, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
