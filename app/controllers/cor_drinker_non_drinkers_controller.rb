class CorDrinkerNonDrinkersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cor_drinker_non_drinker, only: %i[ edit update destroy ]

  # GET /cor_drinker_non_drinkers/new
  def new
    @cor_drinker_non_drinker = CorDrinkerNonDrinker.new
  end

  # GET /cor_drinker_non_drinkers/1/edit
  def edit
  end

  # POST /cor_drinker_non_drinkers or /cor_drinker_non_drinkers.json
  def create
    @cor_drinker_non_drinker = CorDrinkerNonDrinker.new(cor_drinker_non_drinker_params)

    respond_to do |format|
      if @cor_drinker_non_drinker.save
        format.html { redirect_to bn_nominal_roll_url(@cor_drinker_non_drinker.bn_nominal_roll), notice: "Cor drinker non drinker was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cor_drinker_non_drinkers/1 or /cor_drinker_non_drinkers/1.json
  def update
    respond_to do |format|
      if @cor_drinker_non_drinker.update(cor_drinker_non_drinker_params)
        format.html { redirect_to bn_nominal_roll_url(@cor_drinker_non_drinker.bn_nominal_roll), notice: "Cor drinker non drinker was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cor_drinker_non_drinkers/1 or /cor_drinker_non_drinkers/1.json
  def destroy
    @cor_drinker_non_drinker.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@cor_drinker_non_drinker.bn_nominal_roll), notice: "Cor drinker non drinker was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cor_drinker_non_drinker
      @cor_drinker_non_drinker = CorDrinkerNonDrinker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cor_drinker_non_drinker_params
      parameters = params.require(:cor_drinker_non_drinker).permit(:bn_nominal_rolls_id, :drinker_non_drinker, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
