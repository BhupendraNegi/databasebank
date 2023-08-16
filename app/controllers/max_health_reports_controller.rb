class MaxHealthReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_max_health_report, only: %i[ edit update destroy ]

  # GET /max_health_reports/new
  def new
    @max_health_report = MaxHealthReport.new
  end

  # GET /max_health_reports/1/edit
  def edit
  end

  # POST /max_health_reports or /max_health_reports.json
  def create
    @max_health_report = MaxHealthReport.new(max_health_report_params)

    respond_to do |format|
      if @max_health_report.save
        format.html { redirect_to bn_nominal_roll_url(@max_health_report.bn_nominal_roll), notice: "Max health report was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /max_health_reports/1 or /max_health_reports/1.json
  def update
    respond_to do |format|
      if @max_health_report.update(max_health_report_params)
        format.html { redirect_to bn_nominal_roll_url(@max_health_report.bn_nominal_roll), notice: "Max health report was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /max_health_reports/1 or /max_health_reports/1.json
  def destroy
    @max_health_report.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@max_health_report.bn_nominal_roll), notice: "Max health report was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_max_health_report
      @max_health_report = MaxHealthReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def max_health_report_params
      parameters = params.require(:max_health_report).permit(:bn_nominal_rolls_id, :barcode, :ht, :wt, :bp, :haemoglobin, :leucocyte, :neutrophiles, :lymphocytes, :monocytes, :eosinophiles, :basophiles, :glucose, :hbaglycosylated, :thyroid, :urea, :creatinine, :billirubin, :sgot, :sgpt, :cholesterol, :triglycerides, :spg, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
